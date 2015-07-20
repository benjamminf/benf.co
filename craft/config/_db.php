<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(

	// Local server
	'*' => array(

		'tablePrefix' => 'craft',
		'server' => 'localhost',

		'user' => '',
		'password' => '',
		'database' => 'website'
	),

	// Production server
	'website.com' => array(

		'user' => '',
		'password' => '',
		'database' => ''
	)

);
