lessonsDirective = angular.module('TypingTrainer').directive('lessons',($location) ->
  restrict: 'E',
  templateUrl:'/assets/lessons.html',
  replace: true,
  controller: ($scope, $location, $http) ->
    # $scope.lessons = [{lesson_id: "Loading..."}]

    # getLessons = ->
    #   console.log('here')
    #   # data = $routeParams
    #   $http.get('./lessons/' + currentLanguage + '.json', data).success( (data) ->
    #     console.log(data)
    #     $scope.lessons = data
    #     console.log('Successfully loaded lessons.')
    #   ).error( ->
    #     console.error('Failed to load lessons.')
    #   )

    # $scope.selectTrack = (track) ->
    #   console.log('we should be clicking the second button')
    #   $scope.loadLessons = true


    $scope.selectLesson = (lesson) ->
      # console.log('we should be clicking the second button')
      # $scope.loadLessons = true

    # getLessons()

)

lessonsDirective.$inject = ['$scope', '$location', '$http', '$routeParams']