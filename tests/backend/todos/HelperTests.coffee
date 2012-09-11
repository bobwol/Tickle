async = require "async"
helper = require "../../../app/todos/Helper"
Todo = require "../../../app/todos/Todo"
TodoList = require "../../../app/todos/TodoList"
testHelper = require "../helper"

# Todos Helper Tests
# ==================

describe "Todos Helper", ->

	# `getLists(done)` tests
	# ----------------------
	describe "getLists", ->
		beforeEach (setupDone) ->
			# **setup data**
			# - `list1` has 2 todos 
			list1 = new TodoList { name: "List 1" }
			todo1 = new Todo { name: "Todo 1", list: list1._id }
			todo2 = new Todo { name: "Todo 2", list: list1._id }
			list1.todos.push todo1._id, todo2._id
			# - `list2` has no todos
			list2 = new TodoList { name: "List 2" }

			testHelper.cleanAndSetupData {
				cleanup: [Todo, TodoList]
				data: [list1, list2, todo1, todo2]
			}, setupDone

		it "should return all lists and their respective todos", (done) ->
			helper.getLists (err, lists) ->
				lists.length.should.equal 2
				lists[0].todos.length.should.equal 2
				lists[1].todos.length.should.equal 0
				done()

		it "should have lists ordered by `order` then `name`", ->
			
