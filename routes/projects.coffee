

exports.init = (app) -> 
	
	app.get "/projects", (req, res) ->
		res.render "projects/index", 
			title: "Projects"

	app.get "/projects/add", (req, res) ->
		res.render "projects/add",
			title: "Add a Project"

	app.post "/projects/add", (req, res) ->
		