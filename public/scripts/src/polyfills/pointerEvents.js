define(function()
{
	'use strict';

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

			// TODO Pass the event to the element that sits visually underneath.
			// This has issues with the "mouseover" event, so disable it until a workaround is found.
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
