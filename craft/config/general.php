<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(

	// Local server
	'*' => array(

		'omitScriptNameInUrls' => true,
		'testToEmailAddress' => 'benjfleming21@gmail.com',

		'siteUrl' => '/website/public',

		'environmentVariables' => array(
			'basePath' => 'c:\\wamp\\www\\website\\public\\',
			'baseUrl' => '/website/public/'
		)
	),

	// Production server
	'website.com' => array(

		'testToEmailAddress' => false,

		'siteUrl' => '//website.com/',

		'environmentVariables' => array(
			'basePath' => '/home/website/public_html/',
			'baseUrl' => '/'
		)
	)
);
