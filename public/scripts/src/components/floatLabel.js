define(['libs/jquery', 'util/prefixClass', 'util/support'], function($, prefix, support)
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
