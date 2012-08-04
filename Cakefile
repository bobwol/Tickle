{spawn, exec} = require "child_process"

# process the output of a spawned process
# see **[link](http://stackoverflow.com/a/7376108/292291)**
processOutput = (proc) ->
	proc.stdout.on "data", (data) -> 
		console.log data.toString().trim()

task "startdev", "Starts server with nodemon and watch files for changes", ->
	# start nodemon server
	nodemon = spawn "nodemon", ["server.coffee"]
	processOutput nodemon

	# watch and compile CoffeeScript
	coffee = spawn "coffee", ["-o", "public/js/app", "-cw", "clientAssets/coffee"]
	processOutput coffee

	# watch and compile Stylus
	stylus = spawn "stylus", ["clientAssets/stylus", "-l", "-w", "-o", "public/css/app"]
	processOutput stylus

