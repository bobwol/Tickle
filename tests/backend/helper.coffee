async = require "async"

# **Useful links**
# - [`async.forEach`](https://github.com/caolan/async/#forEach)

cleanupTable = (MongooseModel, done) ->
	MongooseModel.remove {}, done

# **`cleanupMongoTables(models, done)`**
# Removes data from MongoDB collection/table
# - `models`: array of mongoose models
# - `done`: done callback from `async.forEach()`
exports.cleanupMongoTables = (models, done) ->
	async.forEach models, cleanupTable, done

saveModelObj = (modelObj, done) -> 
	modelObj.save done

# **`saveMongoData(data)`**
# - `data`: an array of Mongoose model objects
# - `done`: done callback, result of `async.forEach()`
exports.saveMongoData = (data, done) -> 
	async.forEach data, saveModelObj, done

# **`cleanAndSetupData(options, done)`**
# - `options`: something like `{ cleanup: [mongoose models to cleanup], data: [mongoose model objects to save] }`
exports.cleanAndSetupData = (options, done) -> 
	async.series [
		(cleanupDone) -> 
			exports.cleanupMongoTables options.cleanup, cleanupDone
		(setupDone) -> 
			exports.saveMongoData options.data, setupDone
	], done