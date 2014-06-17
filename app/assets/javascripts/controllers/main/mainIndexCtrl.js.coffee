@IndexCtrl = ($scope, $location, $http, postData) ->

  $scope.loadLanguages = false
 # $scope.data = postData.data

 # postData.loadPosts(null)

 $scope.play = ->
  console.log('we should be clicking the button')
  $scope.loadLanguages = true
  # $location.url('/tracks')

  $scope.navNewPost = ->
    $location.url('/post/new')


@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']