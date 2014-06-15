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



# ---------------------------------------
  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $location.url(scriptId + '/gameplay')


  $scope.alert = ->
    alert("Alerted")

  $scope.typos = 0
  $scope.counter = 0
  $scope.totalChars # = $("code span").length;
  $scope.totalKeypress = 0
  $scope.startTime = new Date()
  $scope.endTime
  $scope.CPS
  $scope.chars

  moveCursor = ->
    # true
    $("code span:nth-child("+$scope.counter+")").removeClass('cursor')
    $("code span:nth-child("+($scope.counter + 1)+")").addClass('cursor')

  markBGRed = ->
    $(".cursor").css("color", "red")

  $scope.updateIncorrect = ->
    $scope.typos++
    $("#incorrect").html($scope.typos)


  $scope.addClassTyped = ->
    $("code span:nth-child("+$scope.counter+")").removeClass('untyped')
    $("code span:nth-child("+$scope.counter+")").addClass('typed')

  $scope.isComplete = ->
    if $scope.counter == $scope.totalChars
      $(document).off('keypress')
      alert("Send Data to Rails")
      $scope.endTime = new Date()
      $scope.sendData()

  # $scope.sendData = ->
  #   console.log("Total Keypress: " + $scope.totalKeypress)
  #   console.log("Total totalChars: " + $scope.totalChars)
  #   console.log("$scope.typos:" + $scope.typos)
  #   console.log("Total time: " + (($scope.endTime - $scope.startTime)/1000))
  #   console.log("Total $scope.CPS(chars per second): " + ($scope.totalKeypress / (($scope.endTime - $scope.startTime)/1000)))

  $scope.getChars = ->
    $scope.chars = $scope.script.text.split ""
    console.log("The chars are: " + chars)


  $scope.newCheck = (keypress) ->
    characters = $scope.getChars()
    if keypress == characters[$scope.counter]
      $scope.counter++
      $scope.addClassTyped()
      moveCursor()
    else
      markBGRed()
      $scope.updateIncorrect()

  $scope.listen = ->
    alert("Listening")
    $(document).on "keypress", (event) -> 
      event.preventDefault()
      $scope.totalChars = $("code span").length;
      $scope.totalKeypress++;
      $scope.newCheck( String.fromCharCode(event.which) );      
      $scope.isComplete()

@GamePlayCtrl.$inject = ['$scope','$location', '$routeParams', '$http', '$q', 'scriptData']
