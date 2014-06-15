@GamePlayCtrl = ($scope, $location, $http, $routeParams, $q, scriptData) ->

  $scope.data =
    scriptData: scriptData.data
    currentScript:
      text: 'Loading...'

  $scope.data.scriptId = $routeParams.scriptId

  $scope.prepScriptData = ->
    script = _.findWhere(scriptData.data.scripts, { id: parseInt($scope.data.scriptId) })
    $scope.data.currentScript.text = script.text

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepScriptData)

  # Provide deferred promise chain to the loadPosts function
  scriptData.loadScripts(@deferred)

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepScriptData)

  # Provide deferred promise chain to the loadPosts function
  scriptData.getScripts(@deferred)


  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $location.url(scriptId + '/gameplay')


@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams']
