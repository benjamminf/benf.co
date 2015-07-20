define(['libs/jquery', 'util/createVue'], function($, createVue)
{
	'use strict';

	var arrowToken = '->';

	/**
	 *
	 */
	function modelInit()
	{
		var $this = $(this);

		var modelName = $this.data('model').trim();
		var modelData = {};

		var arrowIndex = modelName.indexOf(arrowToken);
		var firstChar = modelName.length ? modelName.charAt(0) : false;

		if(arrowIndex > -1)
		{
			var dataString = modelName.substr(arrowIndex + arrowToken.length).trim();

			modelName = modelName.substr(0, arrowIndex).trim();
			modelData = JSON.parse(dataString);
		}
		else if(firstChar == '{' || firstChar == '[')
		{
			modelData = JSON.parse(modelName);
			modelName = false;
		}

		var options = {el: this, data: modelData};
		var model = createVue(modelName, options);

		$this.data('model', model);
	}

	/**
	 *
	 */
	return function()
	{
		$('[data-model]').each(modelInit);
	};
});
