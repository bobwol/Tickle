# Tickle
# ======
# [GitHub](https://github.com/jiewmeng/Tickle)
# [Trello](https://trello.com/b/mGeBbmDz)

express = require "express"
routes = require "./routes"
http = require "http"
path = require "path"
require "coffee-script"

app = express()

app.configure () ->
  app.set "port", process.env.PORT || 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))
  app.use require("connect-assets")()

app.configure "development", () ->
  app.use express.errorHandler()

app.get "/", routes.index

http.createServer(app).listen app.get("port"), () ->
  console.log "Express server listening on port " + app.get("port")