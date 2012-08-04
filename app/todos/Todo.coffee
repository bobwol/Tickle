mongoose = require "mongoose"
Schema = mongoose.Schema

todoSchema = new Schema 
	title: String
	desc: String
	dueOn: Date
	completedOn: Date

module.exports = mongoose.model("Todo", todoSchema)