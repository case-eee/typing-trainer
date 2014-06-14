@LessonCtrl = ($scope, $location, $http, $routeParams) ->
	$scope.lessons = [{lesson_id: "Loading..."}]

	trackName = $routeParams.trackName

	getLessons = ->
		data = $routeParams
		$http.get('./lessons/' + trackName + '.json', data).success( (data) ->
			$scope.lessons = data
			console.log('Successfully loaded lessons.')
		).error( ->
			console.error('Failed to load tracks.')
		)

	$scope.selectLesson = (lesson) ->
		$location.url('lessons/' + lesson)

	getLessons()

@LessonCtrl.$inject = ['$scope', '$location', '$http', '$routeParams']