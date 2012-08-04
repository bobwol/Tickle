require "should"
Todos = require "../../../app/todos/Todos.coffee"
Todo = require "../../../app/todos/Todo.coffee"

describe "Todos", ->
	console.log "todo", Todo
	console.log "todos", Todos

	describe "byId", ->
		it "should return Todo with given ID", (done) ->
			Todos.byId 1, (err, todo) ->
				todo.should.be.an.instanceOf(Todo)
				done()
		it "should return null if Todo with given ID does not exists", (done) ->
			Todos.byId 20, (err, todo) ->

	describe "validate", ->
		it "should return true if todo is valid", ->
		it "should return false if todo is invalid", ->
	describe "add", ->
		it "should add the todo into database", ->
	describe "edit", ->
		it "should update todo in database", ->
	describe "delete", ->
		it "should remove todo from the database", ->