mongoose = require "mongoose"
Schema = mongoose.Schema

todoSchema = mongoose.Schema
	name: String
	desc: String
	dueOn: Date
	completedOn: Date
	order: { type: Number, default: 0 }
	list: { type: Schema.Types.ObjectId, ref: "TodoList" }

module.exports = mongoose.model "Todo", todoSchema