mongoose = require "mongoose"
Schema = mongoose.Schema

mongoose.connect "mongoose://localhost/test"

todoSchema = new Schema
	name: String
	desc: String
	dueOn: Date
	completedOn: Date

Todo = mongoose.model "Todo", todoSchema

t1 = new Todo 
	name: "Todo this 1"
	desc: "The first todo"

t2 = new Todo 
	name: "Todo this 2"
	desc: "The second todo"

t1.save (err) ->
	if not err 
		console.log "save ok"
	else
		console.log "ERROR: ", err

t2.save (err) ->
	if not err 
		console.log "save ok"
	else
		console.log "ERROR: ", err

t2.name = "New name"
t2.save (err, todo) ->
	Todo.find {}, (err, todos) ->
		if err 
			console.log "ERROR: ", err
		else 
			for todo in todos 
				console.log todo