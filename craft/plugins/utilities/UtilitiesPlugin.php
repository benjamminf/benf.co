<?php

namespace Craft;

class UtilitiesPlugin extends BasePlugin
{
	function getName()
	{
		return Craft::t('Utilities');
	}

	function getVersion()
	{
		return '1.0.0';
	}

	function getDeveloper()
	{
		return 'Benjamin Fleming';
	}

	function getDeveloperUrl()
	{
		return 'http://benf.co';
	}

	public function addTwigExtension()
	{
		Craft::import('plugins.utilities.twigextensions.UtilitiesTwigExtension');
		return new UtilitiesTwigExtension();
	}
}
