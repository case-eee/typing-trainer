@ProfileCtrl = ($scope, $location, $q) ->
  $scope.user = {
    name: "Mike"
    email: "test@test.com"
  }

  UserLessonsLoaded = false

  getUserLessons = (deferred)->
    if !UserLessonsLoaded
      $http.get('./profile.json').success( (data) ->
        $scope.user.lessons = data
        UserLessonsLoaded = true
        console.log('Successfully loaded users lessons.')
        if deferred
          deferred.resolve()
    ).error( ->
        console.error('Failed to load posts.')
        if deferred
          deferred.reject('Failed to load posts.')
      )
    else
      if deferred
        deferred.resolve()


 @IndexCtrl.$inject = ['$scope', '$location', '$q']