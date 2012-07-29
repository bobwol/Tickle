require "should"
Todos = require "../../../app/todos/Todos.coffee"
Todo = require "../../../app/todos/Todo.coffee"

describe "Todos", ->
	describe "byId", ->
		it "should return Todo with given ID", ->
			todo = Todos.byId(1)
			todo.should.be.an.instanceOf(Todo)
		it "should return null if Todo with given ID does not exists", ->
	describe "validate", ->
		it "should return true if todo is valid", ->
		it "should return false if todo is invalid", ->
	describe "add", ->
		it "should add the todo into database", ->
	describe "edit", ->
		it "should update todo in database", ->
	describe "delete", ->
		it "should remove todo from the database", ->