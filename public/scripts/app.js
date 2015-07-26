(function(root, factory)
{
	if(typeof define === 'function' && define.amd)
	{
		define([], factory);
	}
	else
	{
		root.framework = factory();
	}
}(this, function()
{
/**
 * @license almond 0.3.1 Copyright (c) 2011-2014, The Dojo Foundation All Rights Reserved.
 * Available via the MIT or new BSD license.
 * see: http://github.com/jrburke/almond for details
 */
//Going sloppy to avoid 'use strict' string cost, but strict practices should
//be followed.
/*jslint sloppy: true */
/*global setTimeout: false */

var requirejs, require, define;
(function (undef) {
    var main, req, makeMap, handlers,
        defined = {},
        waiting = {},
        config = {},
        defining = {},
        hasOwn = Object.prototype.hasOwnProperty,
        aps = [].slice,
        jsSuffixRegExp = /\.js$/;

    function hasProp(obj, prop) {
        return hasOwn.call(obj, prop);
    }

    /**
     * Given a relative module name, like ./something, normalize it to
     * a real name that can be mapped to a path.
     * @param {String} name the relative name
     * @param {String} baseName a real name that the name arg is relative
     * to.
     * @returns {String} normalized name
     */
    function normalize(name, baseName) {
        var nameParts, nameSegment, mapValue, foundMap, lastIndex,
            foundI, foundStarMap, starI, i, j, part,
            baseParts = baseName && baseName.split("/"),
            map = config.map,
            starMap = (map && map['*']) || {};

        //Adjust any relative paths.
        if (name && name.charAt(0) === ".") {
            //If have a base name, try to normalize against it,
            //otherwise, assume it is a top-level require that will
            //be relative to baseUrl in the end.
            if (baseName) {
                name = name.split('/');
                lastIndex = name.length - 1;

                // Node .js allowance:
                if (config.nodeIdCompat && jsSuffixRegExp.test(name[lastIndex])) {
                    name[lastIndex] = name[lastIndex].replace(jsSuffixRegExp, '');
                }

                //Lop off the last part of baseParts, so that . matches the
                //"directory" and not name of the baseName's module. For instance,
                //baseName of "one/two/three", maps to "one/two/three.js", but we
                //want the directory, "one/two" for this normalization.
                name = baseParts.slice(0, baseParts.length - 1).concat(name);

                //start trimDots
                for (i = 0; i < name.length; i += 1) {
                    part = name[i];
                    if (part === ".") {
                        name.splice(i, 1);
                        i -= 1;
                    } else if (part === "..") {
                        if (i === 1 && (name[2] === '..' || name[0] === '..')) {
                            //End of the line. Keep at least one non-dot
                            //path segment at the front so it can be mapped
                            //correctly to disk. Otherwise, there is likely
                            //no path mapping for a path starting with '..'.
                            //This can still fail, but catches the most reasonable
                            //uses of ..
                            break;
                        } else if (i > 0) {
                            name.splice(i - 1, 2);
                            i -= 2;
                        }
                    }
                }
                //end trimDots

                name = name.join("/");
            } else if (name.indexOf('./') === 0) {
                // No baseName, so this is ID is resolved relative
                // to baseUrl, pull off the leading dot.
                name = name.substring(2);
            }
        }

        //Apply map config if available.
        if ((baseParts || starMap) && map) {
            nameParts = name.split('/');

            for (i = nameParts.length; i > 0; i -= 1) {
                nameSegment = nameParts.slice(0, i).join("/");

                if (baseParts) {
                    //Find the longest baseName segment match in the config.
                    //So, do joins on the biggest to smallest lengths of baseParts.
                    for (j = baseParts.length; j > 0; j -= 1) {
                        mapValue = map[baseParts.slice(0, j).join('/')];

                        //baseName segment has  config, find if it has one for
                        //this name.
                        if (mapValue) {
                            mapValue = mapValue[nameSegment];
                            if (mapValue) {
                                //Match, update name to the new value.
                                foundMap = mapValue;
                                foundI = i;
                                break;
                            }
                        }
                    }
                }

                if (foundMap) {
                    break;
                }

                //Check for a star map match, but just hold on to it,
                //if there is a shorter segment match later in a matching
                //config, then favor over this star map.
                if (!foundStarMap && starMap && starMap[nameSegment]) {
                    foundStarMap = starMap[nameSegment];
                    starI = i;
                }
            }

            if (!foundMap && foundStarMap) {
                foundMap = foundStarMap;
                foundI = starI;
            }

            if (foundMap) {
                nameParts.splice(0, foundI, foundMap);
                name = nameParts.join('/');
            }
        }

        return name;
    }

    function makeRequire(relName, forceSync) {
        return function () {
            //A version of a require function that passes a moduleName
            //value for items that may need to
            //look up paths relative to the moduleName
            var args = aps.call(arguments, 0);

            //If first arg is not require('string'), and there is only
            //one arg, it is the array form without a callback. Insert
            //a null so that the following concat is correct.
            if (typeof args[0] !== 'string' && args.length === 1) {
                args.push(null);
            }
            return req.apply(undef, args.concat([relName, forceSync]));
        };
    }

    function makeNormalize(relName) {
        return function (name) {
            return normalize(name, relName);
        };
    }

    function makeLoad(depName) {
        return function (value) {
            defined[depName] = value;
        };
    }

    function callDep(name) {
        if (hasProp(waiting, name)) {
            var args = waiting[name];
            delete waiting[name];
            defining[name] = true;
            main.apply(undef, args);
        }

        if (!hasProp(defined, name) && !hasProp(defining, name)) {
            throw new Error('No ' + name);
        }
        return defined[name];
    }

    //Turns a plugin!resource to [plugin, resource]
    //with the plugin being undefined if the name
    //did not have a plugin prefix.
    function splitPrefix(name) {
        var prefix,
            index = name ? name.indexOf('!') : -1;
        if (index > -1) {
            prefix = name.substring(0, index);
            name = name.substring(index + 1, name.length);
        }
        return [prefix, name];
    }

    /**
     * Makes a name map, normalizing the name, and using a plugin
     * for normalization if necessary. Grabs a ref to plugin
     * too, as an optimization.
     */
    makeMap = function (name, relName) {
        var plugin,
            parts = splitPrefix(name),
            prefix = parts[0];

        name = parts[1];

        if (prefix) {
            prefix = normalize(prefix, relName);
            plugin = callDep(prefix);
        }

        //Normalize according
        if (prefix) {
            if (plugin && plugin.normalize) {
                name = plugin.normalize(name, makeNormalize(relName));
            } else {
                name = normalize(name, relName);
            }
        } else {
            name = normalize(name, relName);
            parts = splitPrefix(name);
            prefix = parts[0];
            name = parts[1];
            if (prefix) {
                plugin = callDep(prefix);
            }
        }

        //Using ridiculous property names for space reasons
        return {
            f: prefix ? prefix + '!' + name : name, //fullName
            n: name,
            pr: prefix,
            p: plugin
        };
    };

    function makeConfig(name) {
        return function () {
            return (config && config.config && config.config[name]) || {};
        };
    }

    handlers = {
        require: function (name) {
            return makeRequire(name);
        },
        exports: function (name) {
            var e = defined[name];
            if (typeof e !== 'undefined') {
                return e;
            } else {
                return (defined[name] = {});
            }
        },
        module: function (name) {
            return {
                id: name,
                uri: '',
                exports: defined[name],
                config: makeConfig(name)
            };
        }
    };

    main = function (name, deps, callback, relName) {
        var cjsModule, depName, ret, map, i,
            args = [],
            callbackType = typeof callback,
            usingExports;

        //Use name if no relName
        relName = relName || name;

        //Call the callback to define the module, if necessary.
        if (callbackType === 'undefined' || callbackType === 'function') {
            //Pull out the defined dependencies and pass the ordered
            //values to the callback.
            //Default to [require, exports, module] if no deps
            deps = !deps.length && callback.length ? ['require', 'exports', 'module'] : deps;
            for (i = 0; i < deps.length; i += 1) {
                map = makeMap(deps[i], relName);
                depName = map.f;

                //Fast path CommonJS standard dependencies.
                if (depName === "require") {
                    args[i] = handlers.require(name);
                } else if (depName === "exports") {
                    //CommonJS module spec 1.1
                    args[i] = handlers.exports(name);
                    usingExports = true;
                } else if (depName === "module") {
                    //CommonJS module spec 1.1
                    cjsModule = args[i] = handlers.module(name);
                } else if (hasProp(defined, depName) ||
                           hasProp(waiting, depName) ||
                           hasProp(defining, depName)) {
                    args[i] = callDep(depName);
                } else if (map.p) {
                    map.p.load(map.n, makeRequire(relName, true), makeLoad(depName), {});
                    args[i] = defined[depName];
                } else {
                    throw new Error(name + ' missing ' + depName);
                }
            }

            ret = callback ? callback.apply(defined[name], args) : undefined;

            if (name) {
                //If setting exports via "module" is in play,
                //favor that over return value and exports. After that,
                //favor a non-undefined return value over exports use.
                if (cjsModule && cjsModule.exports !== undef &&
                        cjsModule.exports !== defined[name]) {
                    defined[name] = cjsModule.exports;
                } else if (ret !== undef || !usingExports) {
                    //Use the return value from the function.
                    defined[name] = ret;
                }
            }
        } else if (name) {
            //May just be an object definition for the module. Only
            //worry about defining if have a module name.
            defined[name] = callback;
        }
    };

    requirejs = require = req = function (deps, callback, relName, forceSync, alt) {
        if (typeof deps === "string") {
            if (handlers[deps]) {
                //callback in this case is really relName
                return handlers[deps](callback);
            }
            //Just return the module wanted. In this scenario, the
            //deps arg is the module name, and second arg (if passed)
            //is just the relName.
            //Normalize module name, if it contains . or ..
            return callDep(makeMap(deps, callback).f);
        } else if (!deps.splice) {
            //deps is a config object, not an array.
            config = deps;
            if (config.deps) {
                req(config.deps, config.callback);
            }
            if (!callback) {
                return;
            }

            if (callback.splice) {
                //callback is an array, which means it is a dependency list.
                //Adjust args if there are dependencies
                deps = callback;
                callback = relName;
                relName = null;
            } else {
                deps = undef;
            }
        }

        //Support require(['a'])
        callback = callback || function () {};

        //If relName is a function, it is an errback handler,
        //so remove it.
        if (typeof relName === 'function') {
            relName = forceSync;
            forceSync = alt;
        }

        //Simulate async callback;
        if (forceSync) {
            main(undef, deps, callback, relName);
        } else {
            //Using a non-zero value because of concern for what old browsers
            //do, and latest browsers "upgrade" to 4 if lower value is used:
            //http://www.whatwg.org/specs/web-apps/current-work/multipage/timers.html#dom-windowtimers-settimeout:
            //If want a value immediately, use require('id') instead -- something
            //that works in almond on the global level, but not guaranteed and
            //unlikely to work in other AMD implementations.
            setTimeout(function () {
                main(undef, deps, callback, relName);
            }, 4);
        }

        return req;
    };

    /**
     * Just drops the config on the floor, but returns req in case
     * the config return value is used.
     */
    req.config = function (cfg) {
        return req(cfg);
    };

    /**
     * Expose module registry for debugging and tooling
     */
    requirejs._defined = defined;

    define = function (name, deps, callback) {
        if (typeof name !== 'string') {
            throw new Error('See almond README: incorrect module build, no module name');
        }

        //This module may not have dependencies
        if (!deps.splice) {
            //deps is not an array, so probably means
            //an object literal or factory function for
            //the value. Adjust args.
            callback = deps;
            deps = [];
        }

        if (!hasProp(defined, name) && !hasProp(waiting, name)) {
            waiting[name] = [name, deps, callback];
        }
    };

    define.amd = {
        jQuery: true
    };
}());

define('libs/jquery',[],function()
{
	'use strict';

	var jQuery = (this && this.jQuery) || (window && window.jQuery);

	return jQuery;
});

define('util/camelcase',[],function()
{
	'use strict';

	var rep = function(all, letter)
	{
		return letter.toUpperCase();
	};

	var revRep = function(letter)
	{
		return '-' + letter.toLowerCase();
	};

	function camelcase(string, reverse)
	{
		if(reverse)
		{
			return string.replace(/[A-Z]/g, revRep);
		}

		return string.replace(/[-_]([a-z])/ig, rep);
	}

	camelcase.undo = function(string)
	{
		return camelcase(string, true);
	};

	return camelcase;
});
define('util/support',['util/camelcase'], function(camelcase)
{
	'use strict';

	var support = {
		_el: document.createElement('div'),
		_vendors: 'webkit moz ms o'.split(' '),
		_propCache: {},

		cssProperty: function(property, vendor)
		{
			property = camelcase(property);
			
			if(this._propCache.hasOwnProperty(property))
			{
				return this._propCache[property];
			}

			var cache;
			var style = this._el.style;

			if(typeof style[property] == 'string')
			{
				cache = property;
			}
			else if(vendor !== false)
			{
				var vendors = this._vendors;
				for(var i = 0; i < vendors.length; i++)
				{
					var ven = vendors[i];
					var prop = camelcase(ven + '-' + property);

					if(typeof style[prop] == 'string')
					{
						cache = prop;
						break;
					}
				}
			}
			else
			{
				cache = false;
			}

			this._propCache[property] = cache;
			return cache;
		},

		cssValue: function(property, values)
		{
			property = camelcase.undo(property);
			var css;

			if(typeof values == 'string')
			{
				css = property + ':' + values + ';';
			}
			else
			{
				css = [];
				for(var i = 0; i < values.length; i++)
				{
					css.push(property, ':', values[i], ';');
				}
				css = css.join('');
			}

			this._el.style.cssText = css;
			var hasSupport = !!this._el.style.length;
			this._el.style.cssText = '';

			return hasSupport;
		}
	};

	// TODO Test for all common ones
	var testProperties = [
		'transform',
		'transition'
	];

	for(var i = 0; i < testProperties.length; i++)
	{
		var prop = testProperties[i];
		support[prop] = support.cssProperty(prop);
	}

	support.transitionEnd = support.transition && (function(undefined)
	{
		var el = support._el;
		var transitions = {
			'transition': 'transitionend',
			'OTransition': 'otransitionend', // oTransitionEnd in very old Opera
			'MozTransition': 'transitionend',
			'WebkitTransition': 'webkitTransitionEnd'
		};

		for(var i in transitions)
		{
			if(transitions.hasOwnProperty(i) && el.style[i] !== undefined)
				return transitions[i];
		}

		return false;
	}());

	return support;
});
define('libs/vue',['libs/jquery', 'util/support'], function($, Support)
{
	'use strict';

	var Vue = (this && this.Vue) || (window && window.Vue);


	// Configuration
	// -------------

	Vue.config.debug = true;
	Vue.config.prefix = 'data-v-';
	Vue.config.delimiters = ['(%', '%)'];

	var clsEnter = 'v-enter';
	var clsLeave = 'v-leave';


	// Utilities
	// ---------

	var transitionProp = Support.transition;
	var transitionEnd = Support.transitionEnd;

	/**
	 * Gets the window that an element belongs to.
	 *
	 * @returns Window
	 */
	function getWin(el)
	{
		var doc = el.ownerDocument;
		return doc.defaultView || doc.parentWindow;
	}

	/**
	 * Checks if an element is in the document.
	 *
	 * @returns Boolean
	 */
	function inDoc(el)
	{
		return el.ownerDocument.body.contains(el);
	}

	/**
	 * Checks if an element is in the document and has a display style other than none.
	 *
	 * @returns Boolean
	 */
	function isDisplayed(el)
	{
		return inDoc(el) && getWin(el).getComputedStyle(el).display != 'none';
	}

	/**
	 * Causes a layout redraw for an element.
	 */
	function repaint(el)
	{
		el.offsetWidth;
	}

	/**
	 * Disables a particular property transition on an element.
	 *
	 * @param el
	 * @param prop
	 */
	function disableTransition(el, prop)
	{
		var expression = new RegExp('(,\\s*)?' + prop + '[^,\\n]*', 'g');
		var transition = getComputedStyle(el)[transitionProp];

		el.style[transitionProp] = transition.replace(expression, '').trim() || 'none';
	}


	// Transitions
	// -----------

	// TODO Account for paddings, margins and borders
	['width', 'height'].forEach(function(prop)
	{
		var offsetProp = 'offset' + prop.charAt(0).toUpperCase() + prop.substr(1);
		var eventNS = '.vue-' + prop;
		var state = 0;

		Vue.transition(prop, {

			beforeEnter: function(el)
			{
				var $el = $(el);

				// Determine the state of the element - is it in the document and is it displayed?
				state = isDisplayed(el) ? 0 : (inDoc(el) ? 1 : 2);

				$el.addClass(clsEnter);
				$el.removeClass(clsLeave);
			},

			enter: function(el, done)
			{
				var $el = $(el);
				var style = el.style;
				var endValue;

				$el.off(eventNS);

				// Set the starting height and prepare the transition
				switch(state)
				{
					// If element was never removed from the document,
					// or if it's currently in the middle of the leaving transition
					case 0:
					case 1:
						var startValue = (state === 0 ? el[offsetProp] : 0);

						// Disable transitions as Safari on OSX height changes are CSS repaints in this browser
						disableTransition(el, prop);

						style[prop] = '';

						$el.removeClass(clsEnter + ' ' + clsLeave);

						endValue = el[offsetProp];
						style[prop] = startValue + 'px';

						// Enable transitions
						repaint(el);
						style[transitionProp] = '';
					break;

					// If the element was just created and injected into the document
					default:
						// Remove class after repaints so it gets applied
						repaint(el);
						$el.removeClass(clsEnter + ' ' + clsLeave);

						endValue = el[offsetProp];
						style[prop] = 0;
				}

				// Set the finishing height and invoke the transition through a repaint
				repaint(el);
				style[prop] = endValue + 'px';

				$el.on(transitionEnd + eventNS, function(e)
				{
					// Account for parent/child element transition end events
					if(e.target != this) return;

					$el.off(eventNS);

					// Disable transitions
					disableTransition(el, prop);

					// Unset the fixed height so elements with auto heights can become responsive again
					style[prop] = '';

					// Enable transitions
					repaint(el);
					style[transitionProp] = '';

					done();
				});
			},

			leave: function(el, done)
			{
				var $el = $(el);
				var style = el.style;

				$el.off(eventNS);

				// Set the starting height
				style[prop] = el[offsetProp] + 'px';

				// Reset the transitions
				disableTransition(el, prop);
				repaint(el);
				style[transitionProp] = '';

				$el.addClass(clsLeave);
				$el.removeClass(clsEnter);

				// Set the ending height and begin transition
				style[prop] = 0;

				$el.on(transitionEnd + eventNS, function(e)
				{
					// Account for parent/child element transition end events
					if(e.target != this) return;

					$el.off(eventNS);

					$el.removeClass(clsEnter + ' ' + clsLeave);

					done();
				});
			}
		});
	});


	// Expose
	// ------

	return Vue;
});

define('settings',{

	// The CSS class name prefixes. See the Hydro CSS documentation for an understanding of the methodology.
	classPrefix: {

		// The module class name prefix.
		module: '',

		// The parameter class name prefix.
		parameter: '-',

		// The value class name prefix.
		value: '-',

		// The state class name prefix.
		state: 'is-',

		// The feature class name prefix.
		feature: 'has-',

		// The featureless class name prefix.
		featureless: 'no-'
	}

});

define('util/prefixClass',['settings'], function(settings)
{
	'use strict';

	var prefixes = settings.classPrefix;

	var prefix = function(type, name)
	{
		if(prefixes && prefixes.hasOwnProperty(type))
		{
			var prefix = prefixes[type];
			return name.replace(/[^\s]+/g, prefix + '$&')
		}

		return name;
	};

	for(var type in prefixes) if(prefixes.hasOwnProperty(type))
	{
		(function(type)
		{
			prefix[type] = function(name)
			{
				return prefix(type, name);
			};
		}(type));
	}

	return prefix;
});
define('models/toggler',{

	data: {
		state: 0
	},

	methods: {

		/**
		 *
		 */
		toggle: function()
		{
			this.state = (this.state + 1) % 2;
		},

		/**
		 *
		 */
		open: function()
		{
			this.state = 1;
		},

		/**
		 *
		 */
		close: function()
		{
			this.state = 0;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isOpen: function()
		{
			return this.state === 1;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isClosed: function()
		{
			return this.state === 0;
		}
	}
});

define('models/selector',{

	data: {
		selected: 0,
		total: 0
	},

	computed: {
		interval: {

			get: function()
			{
				return this._interval | 0;
			},

			set: function(v)
			{
				this._interval = v | 0;

				clearInterval(this._intervalId);

				if(this._interval > 0)
				{
					this._intervalId = setInterval(this.next.bind(this), this._interval)
				}
			}
		}
	},

	methods: {

		/**
		 *
		 * @param index
		 */
		select: function(index)
		{
			this.selected = index % this.total;

			if(this.selected < 0)
			{
				this.selected += this.total;
			}
		},

		/**
		 *
		 * @param count
		 */
		go: function(count)
		{
			this.select(this.selected + count);
		},

		/**
		 *
		 */
		next: function()
		{
			this.go(1);
		},

		/**
		 *
		 */
		previous: function()
		{
			this.go(-1);
		},

		/**
		 *
		 * @param index
		 * @returns {boolean}
		 */
		isSelected: function(index)
		{
			return this.selected === index;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isFirst: function()
		{
			return this.selected === 0;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isLast: function()
		{
			return this.selected === this.total - 1;
		}
	}
});

define('polyfills/pointerEvents',['libs/jquery'], function($)
{
	var selector = '*';
	var events = 'click mousedown mouseover'.split(' ');

	function supportsPointerEvents()
	{
		if(navigator.appName == 'Microsoft Internet Explorer')
		{
			var agent = navigator.userAgent;
			if(agent.match(/MSIE ([0-9]{1,}[\.0-9]{0,})/) != null)
			{
				var version = parseFloat(RegExp.$1);
				if(version < 11)
				{
					return false;
				}
			}
		}

		return true;
	}

	function getInvisibleElement(el, top)
	{
		if(el && el !== top)
		{
			var style = getComputedStyle(el);
			if(style.pointerEvents === 'none')
			{
				var current = el;
				while(current !== top)
				{
					var parent = current.parentNode;
					style = getComputedStyle(parent);

					if(style.pointerEvents !== 'none')
					{
						return current;
					}

					current = parent;
				}

				return top;
			}
		}

		return false;
	}

	function listener(e)
	{
		var invisibleEl = getInvisibleElement(e.target, this);
		if(invisibleEl)
		{
			e.stopImmediatePropagation();
			e.preventDefault();

			/*
			var display = invisibleEl.style.display;
			invisibleEl.style.display = 'none';

			var targetEl = document.elementFromPoint(e.clientX, e.clientY);
			$(targetEl).trigger(e.type);

			invisibleEl.style.display = display ? display : '';
			*/
		}
	}

	return function()
	{
		if(!supportsPointerEvents())
		{
			var html = document.documentElement;
			events.forEach(function(event)
			{
				html.addEventListener(event, listener, true);
			});
		}
	}
});

define('components/floatLabel',['libs/jquery', 'util/prefixClass', 'util/support'], function($, prefix, support)
{
	'use strict';

	return function()
	{

	// The float label selector to add functionality to
	var selector = '.float-label';

	// The class names of the various states the float label can have
	var classes = {
		transform: prefix('featureless', 'transform'),
		focused:   prefix('state', 'focused'),
		filled:    prefix('state', 'filled'),
		invalid:   prefix('state', 'invalid'),
		scrolled:  prefix('state', 'scrolled')
	};

	/**
	 * Applies the correct class names to the field
	 * @param e - The event object
	 */
	function setState(e)
	{
		var field = $(this);

		// Wrap within an instantaneous timeout so state changes can be detected on the next redraw. This fixes a
		// problem with the "keydown" event in that the key value is added to the field after the event has been
		// called. This means the value of the field returned will be the previous value. The timeout ensures that
		// the input happens before the value is checked.
		setTimeout(function()
		{
			field.parent()

				// Is the element in focus?
				.toggleClass(classes.focused, (e.type == 'focus') || field.is(':focus'))

				// Check if the fields value is an empty string. This works for select options that have an empty
				// value. This can be exploited by creating an empty option, disabling it and setting it as the
				// default.
				.toggleClass(classes.filled, !!field.val())

				// Only apply if browser supports field validation
				.toggleClass(classes.invalid, field[0].validity ? !field[0].validity.valid : false)

				// Specifically for textarea's. This is useful so that the label can be hidden when the content is
				// scrolled, so that the label and the fields text don't overlap and look ugly.
				.toggleClass(classes.scrolled, field.scrollTop() > 0);
		});
	}

	// Find any field types inside the float label, but don't assume they're immediate children.
	$(selector).toggleClass(classes.transform, !support.cssProperty('transform'))

		// Add events to fields
		.children('input, select, textarea')
			.on('focus blur change keyup keydown scroll', setState)

			// Set states on the page load.
			.each(setState);
	}
});

define('components/imageReady',['libs/jquery', 'util/prefixClass'], function($, prefix)
{
	'use strict';

	var clsReady = prefix('state', 'ready');

	function imageReady()
	{
		var $this = $(this);
		var src = $this.data('image') || $this.prop('src');

		// TODO Handle srcset

		var img = new Image();
		img.onload = function()
		{
			$this.addClass(clsReady);
		};
		img.src = src;
	}

	return function()
	{
		$('img, [data-image]').each(imageReady);
	};
});
define('components/scroll',['libs/jquery'], function($)
{
	'use strict';

	var body = $('html, body');
	var docEl = document.documentElement;

	function scrollClick(e)
	{
		e.preventDefault();

		var scroll = $(this).data('scroll');
		var top = 0;

		switch(scroll)
		{
			case 'top': top = 0; break;
			case 'bottom': top = docEl.scrollHeight - docEl.clientHeight; break;
			default: top = $(scroll).position().top;
		}

		body.animate({scrollTop: top}, {duration: 1000});
	}

	function bodyScroll(e)
	{
		if(e.which > 0)
		{
			switch (e.type)
			{
				case 'mousedown':
				case 'mousewheel':
				case 'touchstart':
					body.stop();
					break;
			}
		}
	}

	return function()
	{
		$('[data-scroll]').on('click', scrollClick);
		body.bind('scroll mousedown DOMMouseScroll mousewheel keyup touchstart', bodyScroll);
	};
});
define('util/createVue',['libs/jquery', 'libs/vue'], function($, Vue)
{
	'use strict';

	return function(name, options)
	{
		options = options || {};

		var defaultOptions = name ? require('models/' + name) : {};
		var initOptions = $.extend(true, {

			methods: {

				prevent: function(e)
				{
					e.preventDefault();
				},

				// TODO Figure out a way to trigger changes inside this method
				matchMedia: function(query)
				{
					var mql = window.matchMedia(query);
				}
			}

		}, defaultOptions, options);

		if(options.hasOwnProperty('$data'))
		{
			initOptions.data = options.$data;
		}

		var model = new Vue(initOptions);
		model.__name__ = name;

		// Set any computed properties
		if(initOptions.hasOwnProperty('computed'))
		{
			for(var option in initOptions.data) if(initOptions.data.hasOwnProperty(option))
			{
				if(initOptions.computed.hasOwnProperty(option))
				{
					model[option] = initOptions.data[option];
				}
			}
		}

		return model;
	}
});

define('components/model',['libs/jquery', 'util/createVue'], function($, createVue)
{
	'use strict';

	var arrowToken = '->';

	/**
	 *
	 */
	function modelInit()
	{
		var $this = $(this);

		var modelName = $this.data('model').trim();
		var modelData = {};

		var arrowIndex = modelName.indexOf(arrowToken);
		var firstChar = modelName.length ? modelName.charAt(0) : false;

		if(arrowIndex > -1)
		{
			var dataString = modelName.substr(arrowIndex + arrowToken.length).trim();

			modelName = modelName.substr(0, arrowIndex).trim();
			modelData = JSON.parse(dataString);
		}
		else if(firstChar == '{' || firstChar == '[')
		{
			modelData = JSON.parse(modelName);
			modelName = false;
		}

		var options = {el: this, data: modelData};
		var model = createVue(modelName, options);

		$this.data('model', model);
	}

	/**
	 *
	 */
	return function()
	{
		$('[data-model]').each(modelInit);
	};
});

define('components/control',['libs/jquery', 'util/createVue'], function($, createVue)
{
	'use strict';

	function controlInit()
	{
		var $this = $(this);

		var controlledSelector = $this.data('control');
		var controlledElement = $(controlledSelector);
		var controlledModel = controlledElement.data('model');

		var modelName = controlledModel.__name__;
		var modelData = controlledModel.$data;

		var options = {el: this, $data: modelData};
		var model = createVue(modelName, options);

		$this.data('model', model);
	}

	return function()
	{
		$('[data-control]').each(controlInit);
	}
});

define('sections/header',['libs/jquery'], function($)
{
	var colors = ['hydro', 'craft'];

	function colorClass(color)
	{
		var prefix = '+background-';

		if(typeof color === 'object' && color.length)
		{
			return prefix + color.join(' ' + prefix);
		}

		return prefix + color;
	}

	return function()
	{
		var doc = $(document.documentElement);
		var hero = $('#hero');
		var menu = $('#menu');

		var toggler = menu.data('model');

		menu.on({

			mouseover: function()
			{
				var link = $(this);
				var color = link.data('slug');

				hero
					.removeClass(colorClass(colors))
					.addClass(colorClass(color));
			},

			mouseout: function()
			{
				hero.removeClass(colorClass(colors));
			},

			focus: function()
			{
				toggler.open();
			},

			blur: function()
			{
				toggler.close();
			}
		}, '.menu_links a');

		menu.on('click', function(e)
		{
			e.stopPropagation();
		});

		doc.on('click', function(e)
		{
			toggler.close();
		});
	};
});

define('main',['libs/jquery','libs/vue','util/camelcase','util/prefixClass','util/support','models/toggler','models/selector','polyfills/pointerEvents','components/floatLabel','components/imageReady','components/scroll','components/model','components/control','sections/header'],function()
{
	'use strict';

	// Global definition
	var def = {
		libs: {
			jQuery: require('libs/jquery'),
			Vue: require('libs/vue')
		},
		util: {
			camelcase: require('util/camelcase'),
			prefixClass: require('util/prefixClass'),
			support: require('util/support')
		},
		models: {
			toggler: require('models/toggler'),
			selector: require('models/selector')
		}
	};

	// Polyfill initialisation
	require('polyfills/pointerEvents')();

	// Component initialisation
	require('components/floatLabel')();
	require('components/imageReady')();
	require('components/scroll')();
	require('components/model')();
	require('components/control')();

	// Section initialisation
	require('sections/header')();

	return def;
});


	return require('main');
}));
