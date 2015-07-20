define(['libs/jquery'], function($)
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