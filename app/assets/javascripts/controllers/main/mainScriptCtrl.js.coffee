@ScriptsCtrl = ($scope, $location, $http, $routeParams, scriptData, $q) ->

  $scope.scripts =
    currentScripts: [{ text: 'Loading...' }]


  $scope.lessonId = $routeParams.lessonId

  $scope.prepLessonScripts = ->
    console.log(scriptData.data.scripts)
    console.log($scope.lessonId)
    scripts = _.where(scriptData.data.scripts, { lesson_id: parseInt($scope.lessonId) })
    console.log(scripts)
    $scope.scripts.currentScripts = scripts

  $scope.selectScript = (script) ->
    $location.url('/gameplay/' + script)

  @deferred = $q.defer()  
  @deferred.promise.then($scope.prepLessonScripts)

# Provide deferred promise chain to the loadPosts function
  scriptData.getScripts(@deferred)

@ScriptsCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', 'scriptData', '$q']