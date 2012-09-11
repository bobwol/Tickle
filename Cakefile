{spawn, exec} = require "child_process"

# Helpers
# -------

# **`procExec(procName)`**
# returns the path to executable in `node_`
procExec = (procName) -> 
	"./node_modules/.bin/" + procName

# **`processOutput(proc)`**
# handle the output of a `spawn`-ed process
# see **[link](http://stackoverflow.com/a/7376108/292291)**
processOutput = (proc) ->
	proc.stdout.on "data", (data) -> 
		console.log data.toString().trim()
	proc.stderr.on "data", (data) -> 
		console.log data.toString().trim()

# **`handleOutput(err, output)`**
# handle the output from a `exec`-ed process
handleOutput = (err, output) ->
	if err then throw err
	console.log output

# **`runMochaOn(folder)`**
# execute `mocha` on given `folder` recursively
runMochaOn = (folder) ->
	exec procExec("mocha") + " -c --reporter spec --recursive --compilers coffee:coffee-script --require should --require tests/backend/initDatabase.js " + folder, handleOutput

# Start/Wacth/Compile Development Server
# --------------------------------------
# **`cake startdev`**
# Starts the server with `nodemon`
# Watch and compile `.coffee` and `.styl` files in `/client`

task "startdev", "Starts server with nodemon and watch files for changes", ->
	# start nodemon server
	nodemon = spawn procExec("nodemon"), ["server.coffee"]
	processOutput nodemon

	# watch and compile CoffeeScript
	coffee = spawn procExec("coffee"), ["-o", "public/js/app", "-cw", "client/coffee"]
	processOutput coffee

	# watch and compile Stylus
	stylus = spawn procExec("stylus"), ["client/stylus/styles.styl", "-I", "public/css/","-l", "-w", "-u", "./node_modules/nib", "-o", "public/css/app"]
	processOutput stylus

	# watch and compile jade
	jade = spawn procExec("jade"), ["client/jade", "--watch", "--out", "public"]
	processOutput jade

# Running Tests
# -------------
# Run tests with **`cake test*`** 

task "test-ui", "Runs UI tests", ->
	runMochaOn "tests/ui"

task "test-backend", "Runs backend unit tests", ->	
	runMochaOn "tests/backend"

task "test-frontend", "Runs frontend unit tests", ->
	runMochaOn "tests/frontend"

task "test", "Runs all tests", ->
	runMochaOn "tests"
