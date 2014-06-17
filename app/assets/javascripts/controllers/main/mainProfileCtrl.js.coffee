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

  # getPerformances = ->
  #   $http.get('./performances.json').success( (data) ->
  #     console.log(data)
  #     $scope.performances = data
  #     console.log('Successfully loaded performances.')
  #   ).error( ->
  #     console.error('Failed to load performances.')
  #   )
  # getPerformances()


  getLessons = ->
    $http.get('./DAlessons.json').success( (data) ->
      console.log(data)
      $scope.lesssons = data
      console.log('Successfully loaded lessons.')
    ).error( ->
      console.error('Failed to load lessons.')
    )
  getLessons()



  $scope.cpsAverage = ->
    for i in performances
      console.log(performance[i].wpm)

  sortOn = (collection, name) ->
    collection.sort (a,b) ->
      if a[name] <= b[name]
        return -1
      return 1

  $scope.groupBy = (attribute) ->
    $scope.groups = []
    sortOn($scope.friends, attribute)
    groupValue = "_INVALID_GROUP_VALUE_"
    i = 0
    while i < $scope.friends.length
      friend = $scope.friends[i]
      # Should we create a new group?
      if friend[attribute] isnt groupValue
        group =
          label: friend[attribute]
          friends: []
        groupValue = group.label
        $scope.groups.push group
      # Add the friend to the currently active grouping.
      group.friends.push friend
      i++

  $scope.friends = [
      {
          name: "Michael"
          gender: "Male"
          hair: "Brunette"
      }
      {
          name: "George Michael"
          gender: "Male"
          hair: "Brunette"
      }
      {
          name: "Gob"
          gender: "Male"
          hair: "Brunette"
      }
      {
          name: "Tobias"
          gender: "Male"
          hair: "Black"
      }
      {
          name: "Lindsay"
          gender: "Female"
          hair: "Blonde"
      }
      {
          name: "Maeby"
          gender: "Female"
          hair: "Black"
      }
  ]

  $scope.groups = [];

@ProfileCtrl.$inject = ['$scope', '$http', '$location']
