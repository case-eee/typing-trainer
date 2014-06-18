@ProfileCtrl = ($scope, $location, $http, $q) ->
  $scope.user = {
    name: "Mike"
    email: "test@test.com"
  }

  UserPerformancesLoaded = false
  $scope.getUserPerformances = ->
    if !UserPerformancesLoaded
      $http.get('./profile.json').success( (data) ->
        $scope.user.performances = data
        UserPerformancesLoaded = true
        console.log('Successfully loaded users Performances.')
    ).error( ->
        console.error('Failed to load Performances.')
      )
  $scope.getUserPerformances()

  $scope.printData = ->
    console.log ($scope.user.performances[0].id)


  $scope.getChart = ->
    $scope.exampleData = [
      key: "FUCK YA HIJOS"
      values: $scope.exampleData = $scope.user.performances
    ]

@ProfileCtrl.$inject = ['$scope', '$location', '$http', '$q']