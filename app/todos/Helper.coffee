# Todos Helper
# ============

TodoList = require "./TodoList"

# **`getLists(done)`**
# Gets `TodoList`s and their respective `Todo`s 
# ordered by `order` then `name`
# - `done` callback has `err, lists` as arguments
exports.getLists = (done) ->
	TodoList.find()
		.populate("todos")
		.sort("order name")
		.exec done

