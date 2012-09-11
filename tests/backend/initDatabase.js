require("coffee-script")
config = require("../../config")
mongoose = require("mongoose")

mongoose.connect("localhost", config.database.testing)