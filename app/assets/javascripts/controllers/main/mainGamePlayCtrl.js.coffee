@GamePlayCtrl = ($scope, $location) ->
  
  $scope.restart = ->
    $location.url('/gameplay')

  $scope.typos = 0
  $scope.counter = 0
  $scope.totalChars # = $("code span").length;
  $scope.totalKeypress = 0
  $scope.startTime = new Date()
  $scope.endTime
  $scope.CPS


  $scope.moveCursor = ->
    $("code span:nth-child("+counter+")").removeClass('cursor')
    $("code span:nth-child("+(counter + 1)+")").addClass('cursor')

  $scope.markBGRed = ->
    $(".cursor").css("color", "red")

  $scope.updateIncorrect = ->
    typos++
    $("#incorrect").html(typos)

  $scope.addClassTyped = ->
    $("code span:nth-child("+counter+")").removeClass('untyped')
    $("code span:nth-child("+counter+")").addClass('typed')

  $scope.isComplete = ->
    if counter == totalChars
      $(document).off('keypress')
      alert("Send Data to Rails")
      endTime = new Date()
      $scope.sendData()

  @scope.sendData = ->
    console.log("Total Keypress: " + totalKeypress)
    console.log("Total totalChars: " + totalChars)
    console.log("Total typos: " + typos)
    console.log("Total time: " + ((endTime - startTime)/1000))
    console.log("Total CPS(chars per second): " + (totalKeypress / ((endTime - startTime)/1000)))

  # $scope.getChars = ->
  #   chars = [];
  #   $.each($("code span") = (i,e)-> 
  #     chars.push(e.innerHTML)
  #   chars
  # };//getChars

  $scope.newCheck = (keypress) ->
    characters = getChars()
    if keypress == characters[counter]
      counter++
      addClassTyped()
      moveCursor()
    else 
      markBGRed()
      updateIncorrect()

  $scope.listen = ->
    $(document).keypress = (event) -> 
    event.preventDefault()
    totalChars = $("code span").length;
    totalKeypress++;
    moveCursor();
    newCheck( String.fromCharCode(event.which) );      
    isComplete()


@GamePlayCtrl.$inject = ['$scope', '$location']