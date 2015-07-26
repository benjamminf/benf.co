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
		'rotateImagesOnUploadByExifData' => false,
		'testToEmailAddress' => 'benjfleming21@gmail.com',
		'devMode' => true,

		'siteUrl' => '/benf.co/public',

		'environmentVariables' => array(
			'basePath' => 'c:\\wamp\\www\\benf.co\\public\\',
			'baseUrl' => '/benf.co/public/'
		)
	),

	// Production server
	'benf.co' => array(

		'testToEmailAddress' => false,
		'devMode' => false,

		'siteUrl' => '//benf.co/',

		'environmentVariables' => array(
			'basePath' => '/home/website/public_html/',
			'baseUrl' => '//benf.co/'
		)
	)
);
