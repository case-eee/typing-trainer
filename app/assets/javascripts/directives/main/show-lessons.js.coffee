showLessons = angular.module('TypingTrainer').directive('showLessons',($location) ->
  restrict: 'E',
  templateUrl:'/assets/show-lessons.html',
  controller: ($scope, $location, $http, $routeParams) ->
    $scope.loadLessons = false
    # $scope.lessons = [{lesson_id: "Loading..."}]

    trackName = $routeParams.trackName

    getLessons = ->
      console.log(here)
      data = $routeParams
      $http.get('./lessons/' + trackName + '.json', data).success( (data) ->
        console.log(data)
        $scope.lessons = data
        console.log('Successfully loaded lessons.')
      ).error( ->
        console.error('Failed to load lessons.')
      )

    $scope.selectTrack = (track) ->
      console.log('we should be clicking the second button')
      $scope.loadLessons = true


    $scope.selectLesson = (lesson) ->
      # console.log('we should be clicking the second button')
      # $scope.loadLessons = true

    getLessons()

)

showLessons.$inject = ['$scope', '$location', '$http', '$routeParams']