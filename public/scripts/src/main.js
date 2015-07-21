define(function()
{
	'use strict';

	// Global definition
	var def = {
		libs: {
			jQuery: require('libs/jquery'),
			Vue: require('libs/vue')
		},
		util: {
			camelcase: require('util/camelcase'),
			prefixClass: require('util/prefixClass'),
			support: require('util/support')
		},
		models: {
			toggler: require('models/toggler'),
			selector: require('models/selector')
		}
	};

	// Component initialisation
	require('components/floatLabel')();
	require('components/imageReady')();
	require('components/scroll')();
	require('components/model')();
	require('components/control')();

	// Section initialisation
	require('sections/header')();

	return def;
});
