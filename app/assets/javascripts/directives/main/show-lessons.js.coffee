showLessons = angular.module('TypingTrainer').directive('showLessons',($location) ->
  restrict: 'E',
  templateUrl:'/assets/show-lessons.html',
  controller: ($scope, $location, $http, $routeParams) ->
    $scope.lessons = [{lesson_id: "Loading..."}]

    trackName = $routeParams.trackName

    getLessons = ->
      data = $routeParams
      $http.get('./lessons/' + trackName + '.json', data).success( (data) ->
        console.log(data)
        $scope.lessons = data
        console.log('Successfully loaded lessons.')
      ).error( ->
        console.error('Failed to load lessons.')
      )

    $scope.selectLesson = (lesson) ->
      console.log('we should be clicking the button')
      $scope.loadLanguages = true

    getLessons()

)

showLanguages.$inject = ['$scope', '$location', '$http', '$routeParams']