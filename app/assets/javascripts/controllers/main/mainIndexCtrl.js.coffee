@IndexCtrl = ($scope, $location, $http, postData) ->

 # $scope.data = postData.data

 # postData.loadPosts(null)

 $scope.play = ->
  $location.url('/tracks')

  $scope.navNewPost = ->
    $location.url('/post/new')


@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']