Developer Guide
===============

Application Structure
---------------------

	/app 					# server side CoffeeScript
		/{module}				# module related files
	/clientAssets			# client side assets
		/coffee 				
		/stylus
	/public					# client side assets (should contain mostly 3rd party libraries)
	/tests					# test related files
		/frontend			# unit tests (Mocha)
		/backbend
		/unit 				# ui tests (ZombieJS)
	/docs					# markdown documentation

