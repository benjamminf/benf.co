define(['libs/jquery', 'util/createVue'], function($, createVue)
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
