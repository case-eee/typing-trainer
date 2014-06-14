@ScriptsCtrl = ($scope, $location, $http, $routeParams) ->
	$scope.scripts = [{text: "Loading..."}]

	lessonId = $routeParams.lessonId

	getScripts = ->
		data = $routeParams
		$http.get('./scripts/' + lessonId + '.json', data).success( (data) ->
			$scope.scripts = data
			console.log('Successfully loaded scripts.')
		).error( ->
			console.error('Failed to load scripts.')
		)

	$scope.selectScript = (script) ->
		$location.url('/gameplay')

	getScripts()

@ScriptsCtrl.$inject = ['$scope', '$location', '$http', '$routeParams']