define(['libs/jquery'], function($)
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
