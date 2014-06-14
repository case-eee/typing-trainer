@GamePlayCtrl = ($scope) ->
  
  $scope.restart = ->
    $location.url('/gameplay')



@GamePlayCtrl.$inject = ['$scope']


  # $scope.data =
  #   postData: postData.data
  #   currentPost:
  #     title: 'Loading...'
  #     contents: ''

  # $scope.data.postId = $routeParams.postId

  # $scope.prepPostData = ->
  #   post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId) })
  #   $scope.data.currentPost.title = post.title
  #   $scope.data.currentPost.contents = post.contents

  # $scope.navNewPost = ->
  #   $location.url('/post/new')

  # $scope.navHome = ->
  #   $location.url('/')

  # # Create promise to be resolved after posts load
  # @deferred = $q.defer()
  # @deferred.promise.then($scope.prepPostData)

  # # Provide deferred promise chain to the loadPosts function
  # postData.loadPosts(@deferred)
