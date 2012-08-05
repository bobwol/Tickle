{spawn, exec} = require "child_process"
glob = require "glob"

# handle the output of a `spawn`-ed process
# see **[link](http://stackoverflow.com/a/7376108/292291)**
processOutput = (proc) ->
	proc.stdout.on "data", (data) -> 
		console.log data.toString().trim()

# handle the output from a `exec`-ed process
handleOutput = (err, output) ->
	if err then throw err
	console.log output

# execute `mocha` on given `folder` recursively
runMochaOn = (folder) ->
	exec "mocha -c --reporter spec --recursive --compilers coffee:coffee-script " + folder, handleOutput


task "startdev", "Starts server with nodemon and watch files for changes", ->
	# start nodemon server
	nodemon = spawn "nodemon", ["server.coffee"]
	processOutput nodemon

	# watch and compile CoffeeScript
	coffee = spawn "coffee", ["-o", "public/js/app", "-cw", "client/coffee"]
	processOutput coffee

	# watch and compile Stylus
	stylus = spawn "stylus", ["client/stylus", "-l", "-w", "-o", "public/css/app"]
	processOutput stylus


task "test-ui", "Runs UI tests", ->
	runMochaOn "tests/ui"

task "test-backend", "Runs backend unit tests", ->	
	runMochaOn "tests/backend"

task "test-frontend", "Runs frontend unit tests", ->
	runMochaOn "tests/frontend"

task "test", "Runs all tests", ->
	runMochaOn "tests"
