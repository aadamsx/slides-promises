fs = require "fs"
P  = require "pacta"

extendArrayOfCollections = (array) ->
	r = {}
	r[k] = v for k, v of dict for dict in array
	return r

readFile = (filename) ->
	promise = new P
	fs.readFile filename, enconding: "utf8", (err, data) ->
		if err
			promise.reject err
		else
			promise.resolve data
	return promise

parseStr = (str) ->
	promise = new P
	try
		result = JSON.parse str
		promise.resolve result
	catch e
		promise.reject e
	return promise



# p1 = readFile("1.json").chain parseStr
# p2 = readFile("2.json").chain parseStr
# p3 = readFile("2.json").chain parseStr
# p4 = P.of([]).append(p1).append(p2).append(p3)
# p4.map(extendArrayOfCollections).then console.log, console.error

filenames = ["1.json", "2.json", "2.json"]
arrayOfPromises = [P.of []].concat filenames.map (filename) -> readFile(filename).chain parseStr

promiseOfArrays = arrayOfPromises.reduce (a,b) -> a.append b
promiseOfArrays.map(extendArrayOfCollections).then console.log, console.error