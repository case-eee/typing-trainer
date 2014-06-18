@ProfileCtrl = ($scope, $location, $http, $q) ->
  $scope.user = {
    name: "Mike"
    email: "test@test.com"
  }

  UserLessonsLoaded = false

  $scope.getUserLessons = ->
    if !UserLessonsLoaded
      $http.get('./profile.json').success( (data) ->
        $scope.user.lessons = data
        UserLessonsLoaded = true
        console.log('Successfully loaded users lessons.')
    ).error( ->
        console.error('Failed to load lessons.')
      )


 @IndexCtrl.$inject = ['$scope', '$location', '$http', '$q']