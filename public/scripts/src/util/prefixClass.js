define(['settings'], function(settings)
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