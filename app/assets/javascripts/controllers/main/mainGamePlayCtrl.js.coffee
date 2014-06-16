@GamePlayCtrl = ($scope, $location, $http, $routeParams, $q, scriptData) ->
  $scope.$on "my:keypress", (event, keyEvent) ->
    $scope.listen(keyEvent)

  $scope.typos = 0
  $scope.counter = 0
  $scope.totalKeypress = 0
  $scope.startTime = new Date()
  $scope.endTime
  $scope.time_elapsed
  $scope.CPS
  $scope.charList
  $scope.missedChars = []
  $scope.finished = false
  $scope.mostMissedChar
  $scope.missedTimes

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

# --Game Play ------------------------

  $scope.sendData = ->
    $scope.cps = ($scope.totalKeypress / (($scope.endTime - $scope.startTime)/1000))
    $scope.time_elapsed = new Date( ($scope.endTime - $scope.startTime) )
    # Create data object to POST
    completionData =
      new_performance:
        number_missed: $scope.typos
        total_characters: $scope.charList.length
        time_elapsed: $scope.time_elapsed
        wpm: $scope.cps
        script_id: $scope.scriptId
        missed_characters: $scope.missedChars.toString()

    # Do POST request to /posts.json
    $http.post('./performances.json', completionData).success( (data) ->
      $scope.mostMissedChar = data.character.toString()
      $scope.missedTimes = data.times.toString()
      console.log("Successfully sent data.")
    ).error( ->
      console.error('Failed to create new post.')
    )
    
    # Log the data
    $scope.finished = true
    console.log("Total Keypress: " + $scope.totalKeypress)
    console.log("Total $scope.charList.length: " + $scope.charList.length)
    console.log("$scope.typos:" + $scope.typos)
    console.log("Total time: " + $scope.time_elapsed)
    console.log("Total $scope.CPS(chars per second): " + $scope.cps)
    console.log("Missed characters: " + $scope.missedChars)

  markBGRed = ->
    $(".cursor").css("color", "red")

  moveCursor = ->
    $("code span:nth-child("+$scope.counter+")").removeClass('cursor')
    $("code span:nth-child("+($scope.counter + 1)+")").addClass('cursor')

  $scope.getChars = ->
    $scope.charList = $scope.script.currentScript.text.split ""

  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $location.url('/gameplay/' + scriptId)

  $scope.addClassTyped = ->
    $("code span:nth-child("+$scope.counter+")").removeClass('untyped')
    $("code span:nth-child("+$scope.counter+")").addClass('typed')

  $scope.isComplete = ->
    if $scope.counter == $scope.charList.length
      $scope.endTime = new Date()
      $scope.sendData()
    
  $scope.newCheck = (keypress) ->
    characters = $scope.getChars()
    if keypress == characters[$scope.counter]
      $scope.counter++
      $scope.addClassTyped()
      moveCursor()
    else
      markBGRed()
      $scope.typos++
      $scope.missedChars.push(characters[$scope.counter])


  $scope.listen = (event) ->
    event.preventDefault()
    $scope.totalKeypress++;
    $scope.newCheck( String.fromCharCode(event.which) );      
    $scope.isComplete()

@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', '$q', 'scriptData']