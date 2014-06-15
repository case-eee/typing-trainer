@GamePlayCtrl = ($scope, $location, $http, $routeParams, $q, scriptData) ->
  $scope.typos = 0
  $scope.counter = 0
  $scope.totalKeypress = 0
  $scope.startTime = new Date()
  $scope.endTime
  $scope.CPS
  totalChars = tempChars.length

  tempChars = "var awesomeness = function(){alert('AWESOME')};"
  $scope.tempChars2 = tempChars.split ""


  $scope.$on "my:keypress", (event, keyEvent) ->
    $scope.listen(keyEvent)


  moveCursor = ->
    # true
    $("code span:nth-child("+$scope.counter+")").removeClass('cursor')
    $("code span:nth-child("+($scope.counter + 1)+")").addClass('cursor')

  markBGRed = ->
    $(".cursor").css("color", "red")

  $scope.updateIncorrect = ->
    $scope.typos++

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

  $scope.addClassTyped = ->
    $("code span:nth-child("+$scope.counter+")").removeClass('untyped')
    $("code span:nth-child("+$scope.counter+")").addClass('typed')

  $scope.isComplete = ->
    if $scope.counter == totalChars
      # $(document).off('keypress')
      alert("Send Data to Rails")
      $scope.endTime = new Date()
      $scope.sendData()

  $scope.sendData = ->
    console.log("Total Keypress: " + $scope.totalKeypress)
    console.log("Total totalChars: " + $scope.totalChars)
    console.log("$scope.typos:" + $scope.typos)
    console.log("Total time: " + (($scope.endTime - $scope.startTime)/1000))
    console.log("Total $scope.CPS(chars per second): " + ($scope.totalKeypress / (($scope.endTime - $scope.startTime)/1000)))

  $scope.getChars = ->
    "var awesomeness = function(){alert('AWESOME')};".split ""

  $scope.newCheck = (keypress) ->
    characters = $scope.getChars()
    if keypress == characters[$scope.counter]
      $scope.counter++
      $scope.addClassTyped()
      moveCursor()
    else
      markBGRed()
      $scope.updateIncorrect()

  $scope.listen = (event) ->
    # $(document).on "keypress", (event) -> 
      $scope.totalKeypress++;
      $scope.newCheck( String.fromCharCode(event.which) );      
      $scope.isComplete()

  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $location.url('/gameplay/' + scriptId)

@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', '$q', 'scriptData']