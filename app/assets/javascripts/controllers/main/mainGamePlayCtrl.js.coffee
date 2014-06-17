@GamePlayCtrl = ($scope, $location, $http, $routeParams, $q, scriptData, $route) ->

  $scope.typos = 0
  $scope.counter = 0
  $scope.totalKeypress = 0
  $scope.startTime 
  $scope.endTime
  $scope.time_elapsed
  $scope.CPS
  $scope.charList
  $scope.missedChars = []
  $scope.mostMissedChar
  $scope.missedTimes
  $scope.unbdindBroadcast
  $scope.enterCall = false

  $scope.script =
    currentScript:
      text: 'Loading...'
      id: ''

  $scope.scriptId = $routeParams.scriptId

  prepScriptData = ->
    script = _.findWhere(scriptData.data.scripts, { id: parseInt($scope.scriptId) })
    $scope.script.currentScript.text = script.text
    $scope.script.currentScript.id = script.id
    $scope.charList = $scope.script.currentScript.text.split ""
  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then(prepScriptData)

  # Provide deferred promise chain to the loadPosts function
  scriptData.getScripts(@deferred)

# --Game Play ------------------------

  sendData = ->
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
      #dataSent = true
    ).error( ->
      console.error('Failed to create new post.')
    )
    
    # Log the data
    console.log("Total Keypress: " + $scope.totalKeypress)
    console.log("Total $scope.charList.length: " + $scope.charList.length)
    console.log("$scope.typos:" + $scope.typos)
    console.log("Total time: " + $scope.time_elapsed)
    console.log("Total $scope.CPS(chars per second): " + $scope.cps)
    console.log("Missed characters: " + $scope.missedChars)

  markRed = ->
    $(".cursor").css("color", "red")

  moveCursor = ->
    if $scope.counter == 0
      $("code span:first").removeClass('cursor untyped')
    else
      $("code span:nth-child("+$scope.counter+")").removeClass('untyped cursor')
    $("code span:nth-child("+($scope.counter+1)+")").addClass('cursor typed')

  # $scope.getChars = ->
  #   $scope.charList = $scope.script.currentScript.text.split ""

  $scope.restart = (scriptId) ->
    console.log(scriptId)
    $route.reload()

  isComplete = ->
    if $scope.counter == $scope.charList.length
      $scope.unbdindBroadcast()
      $scope.endTime = new Date()
      sendData()
    
  checkKey = (keypress) ->
    if keypress == $scope.charList[$scope.counter]
      if $scope.charList[$scope.counter] == "\n"
        $scope.enterCall = false
      $scope.counter++
      moveCursor()
    else
      $scope.typos++
      markRed()
      $scope.missedChars.push($scope.charList[$scope.counter])

  # $scope.listen = (event) ->
  #   $scope.totalKeypress++
  #   checkKey( String.fromCharCode(event.which) )
  #   isComplete()


  $scope.listen = (event) ->
    $scope.totalKeypress++
    if $scope.charList[$scope.counter + 1] == "\n"
      $scope.enterCall = true
    event.preventDefault()
    # debugger
    if event.which == 13
      checkKey( String.fromCharCode(10) )
    else 
      checkKey( String.fromCharCode(event.which || event.charCode || event.keyCode ) )
    isComplete()

  $scope.start = ->
    $scope.startTime = new Date()
    $("code span:first").addClass('cursor')
    $('button').hide()
    $scope.unbdindBroadcast = $scope.$on "my:keypress", (event, keyEvent) ->
        $scope.listen(keyEvent)


@GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', '$q', 'scriptData', '$route']