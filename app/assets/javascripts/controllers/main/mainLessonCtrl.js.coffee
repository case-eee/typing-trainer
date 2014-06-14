@LessonCtrl = ($scope, $location, $http, $routeParams) ->
	$scope.lessons = [{lesson_id: "Loading..."}]

	getLessons = ->
		data = $routeParams
		$http.get('./lessons/JavaScript.json', data).success( (data) ->
			$scope.lessons = data
			console.log('Successfully loaded lessons.')
		).error( ->
			console.error('Failed to load tracks.')
		)

	$scope.selectLesson = (lesson) ->
		$location.url('lessons/' + lesson)

	getLessons()

@LessonCtrl.$inject = ['$scope', '$location', '$http']