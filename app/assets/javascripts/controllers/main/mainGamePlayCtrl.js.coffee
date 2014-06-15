@GamePlayCtrl = ($scope, $location, $http, $routeParams, $q, scriptData) ->

  $scope.script =
    currentScript:
      text: 'Loading...'
      id: ''

  $scope.scriptId = $routeParams.scriptId

  $scope.prepScriptData = ->
    script = _.findWhere(scriptData.data.scripts, { id: parseInt($scope.scriptId) })
    $scope.script.currentScript.text = script.text
    $scope.script.currentScript.id = script.id

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepScriptData)

  # Provide deferred promise chain to the loadPosts function
  scriptData.getScripts(@deferred)

  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $location.url('/gameplay/' + scriptId)

@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', '$q', 'scriptData']
