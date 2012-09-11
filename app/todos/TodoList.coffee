mongoose = require "mongoose"
Schema = mongoose.Schema
require "./Todo"

listSchema = mongoose.Schema
	name: String
	order: { type: Number, default: 0 }
	todos: [{ type: Schema.Types.ObjectId, ref: "Todo" }]

module.exports = mongoose.model "TodoList", listSchema