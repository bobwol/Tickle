Developer Guide
===============

Tools & Frameworks
------------------

- ExpressJS
- MongoDB (via Mongoose)
- BackboneJS
- CoffeeScript (JS), Stylus (CSS) & Jade (HTML)

*See `package.json`* for more 

Application Structure
---------------------

	/app 					# server side CoffeeScript
		/{module}				# module related files
	/client					# client side assets
		/coffee 				# compiled into `/public/js/app`
		/stylus 				# compiled into `/public/css/app`
	/public					# public web root (should contain mostly 3rd party libraries)
	/tests					# test related files
		/frontend			
		/backbend
		/unit 				
	/docs					# markdown documentation


Starting to develop
-------------------

**`cake startdev`**

Will start the Node/Express application with `nodemon`, watch & compile CoffeeScript & Stylus files

**`cake test`**

Runs `mocha` all tests. To just run tests for backend/frontend/ui, run something like `cake test-ui`

Test Driven Development
-----------------------

Unit Tests are developed with [Mocha][mocha] with [`should.js`][should]. 
	
	- Unit tests will be developed for both back & front end CoffeeScript. To test return values (maybe side-effects if necessary, with [`sinon`][sinon])
	- UI tests will be developed to test UI, that elements are present with correct values/classes as applicable

UI tests are developed using [`zombie.js`][zombie]


[mocha]: http://visionmedia.github.com/mocha/
[should]: https://github.com/visionmedia/should.js/tree/#readme
[zombie]: http://zombie.labnotes.org/
[sinon]: http://sinonjs.org/