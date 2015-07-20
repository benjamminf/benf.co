define(['libs/jquery', 'util/support'], function($, Support)
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
