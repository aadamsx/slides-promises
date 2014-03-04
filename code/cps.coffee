fs = require "fs"

extendArrayOfCollections = (array) ->
	r = {}
	r[k] = v for k, v of dict for dict in array
	return r

fs.readFile "1.json", (err, data) ->
	if err
		console.error err
	else
		try
			result1 = JSON.parse data
			fs.readFile "2.json", (err, data) ->
				if err
					console.error err
				else
					try
						result2 = JSON.parse data
						result  = extendArrayOfCollections [result1, result2]
						console.log result
					catch ex
						console.error ex
		catch ex
			console.error ex


