define(['libs/jquery', 'util/prefixClass'], function($, prefix)
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