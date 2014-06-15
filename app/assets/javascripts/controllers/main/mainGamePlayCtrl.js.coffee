@GamePlayCtrl = ($scope, $location) ->


  $scope.alert = ->
    alert("Alerted")

  $scope.typos = 0
  $scope.counter = 0
  $scope.totalChars # = $("code span").length;
  $scope.totalKeypress = 0
  $scope.startTime = new Date()
  $scope.endTime
  $scope.CPS

  $scope.moveCursor = ->
    $("code span:nth-child("+$scope.counter+")").removeClass('cursor')
    $("code span:nth-child("+($scope.counter + 1)+")").addClass('cursor')

  $scope.markBGRed = ->
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

  @scope.sendData = ->
    console.log("Total Keypress: " + $scope.totalKeypress)
    console.log("Total totalChars: " + $scope.totalChars)
    console.log("$scope.typos:" + $scope.typos)
    console.log("Total time: " + (($scope.endTime - $scope.startTime)/1000))
    console.log("Total $scope.CPS(chars per second): " + ($scope.totalKeypress / (($scope.endTime - $scope.startTime)/1000)))

  $scope.getChars = ->
    chars = [];
    for i in [0..$("code span").length] by 1
      e = $("code span")[i]
      chars.push(e.innerHTML)
      chars

  $scope.newCheck = (keypress) ->
    characters = $scope.getChars()
    if keypress == characters[$scope.counter]
      $scope.counter++
      $scope.addClassTyped()
      $scope.moveCursor()
    else
      $scope.markBGRed()
      $scope.updateIncorrect()

  $scope.listen = ->
    alert("Listening")
    $(document).on "keypress", (event) -> 
      event.preventDefault()
      $scope.totalChars = $("code span").length;
      $scope.totalKeypress++;
      $scope.moveCursor();
      $scope.newCheck( String.fromCharCode(event.which) );      
      $scope.isComplete()

  $scope.restart = ->
    $location.url('/gameplay')

@GamePlayCtrl.$inject = ['$scope', '$location']