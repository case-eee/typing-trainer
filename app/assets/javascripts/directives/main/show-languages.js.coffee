showLanguages = angular.module('TypingTrainer').directive('showLanguages',($location) ->
  restrict: 'E',
  templateUrl:'/assets/show-languages.html',
  controller: ($scope, $location, $http) ->
    $scope.loadLanguages = false
    # $scope.tracks = [{name: 'Loading...'}]

    getTracks = ->
      $http.get('./languages.json').success( (data) ->
        $scope.tracks = data
        console.log('Successfully loaded tracks.')
        console.log($scope.tracks)
      ).error( ->
        console.error('Failed to load tracks.')
      )

    $scope.selectTrack = (track) ->
      console.log('we should be clicking the second button')
      $scope.loadLessons = true

    $scope.play = ->
      console.log('we should be clicking the button')
      $scope.loadLanguages = true
    # $location.url('/tracks')

    getTracks()
)

showLanguages.$inject = ['$scope', '$location', '$http']