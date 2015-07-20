define(['libs/jquery', 'libs/vue'], function($, Vue)
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
