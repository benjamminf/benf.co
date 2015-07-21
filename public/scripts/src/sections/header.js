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
		var hero = $('#hero');

		$('#header .header_menu a').on({

			mouseover: function()
			{
				var link = $(this);
				var color = link.data('entry');

				hero
					.removeClass(colorClass(colors))
					.addClass(colorClass(color));
			},

			mouseout: function()
			{
				hero.removeClass(colorClass(colors));
			}
		});
	};
});
