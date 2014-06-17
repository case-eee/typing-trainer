@IndexCtrl = ($scope, $location, $http, postData) ->

  $scope.loadLanguages = false
 # $scope.data = postData.data

 # postData.loadPosts(null)

 play = ->
  console.log('we should be clicking the button')
  $scope.loadLanguages = true
  # $location.url('/tracks')


@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']