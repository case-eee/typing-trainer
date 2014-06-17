@ProfileCtrl = ($scope, $http, $location) ->
  $scope.user

  getUser = ->
    $http.get('./profile.json').success( (data) ->
      console.log(data)
      $scope.user = data
      console.log('Successfully loaded user.')
    ).error( ->
      console.error('Failed to load user.')
    )
  
  getUser()

  getPerformances = ->
    $http.get('./performances.json').success( (data) ->
      console.log(data)
      $scope.performances = data
      console.log('Successfully loaded performances.')
    ).error( ->
      console.error('Failed to load performances.')
    )
  getPerformances()

  $scope.cpsAverage = ->
    for i in performances
      console.log(performance[i].wpm)


@ProfileCtrl.$inject = ['$scope', '$http', '$location']

# current_user return user object
# user_signed_in return true or false