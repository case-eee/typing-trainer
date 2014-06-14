@GamePlayCtrl = ($scope, $location, $http, $routeParams) ->
  $scope.script = [{text: "Loading..."}]

  scriptId = $routeParams.scriptId

  getScript = ->
    data = $routeParams
    $http.get('./' + scriptId + '/gameplay', data).success( (data) ->
      $scope.script = data
      console.log($scope.script)
      console.log('Successfully loaded current script')
    ).error( ->
      console.error('Failed to load current script')
    )

  $scope.restart = ->
    $location.url('/gameplay')

  getScript()

@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams']


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
