express = require "express"
http = require "http"
fs = require "fs"
path = require "path"
app = express()
mongoose = require "mongoose"
config = require "./config"

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()
  mongoose.connect "localhost", config.database.development

app.configure "production", ->
  mongoose.connect "localhost", config.database.production

# initialize all router files in ./routes
routesPath = "routes"
files = fs.readdirSync routesPath
files.forEach (file) ->
  filePath = path.resolve "./", routesPath, file
  route = require filePath
  console.log filePath
  route.init(app)

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

