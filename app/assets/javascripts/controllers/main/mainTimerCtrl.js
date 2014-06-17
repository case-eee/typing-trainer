function timerCtrl($scope, $timeout) {
	// $scope.counter = 0;
	$scope.counter = 0
	$scope.onTimeout = function(){
		$scope.counter++
		mytimeout = $timeout($scope.onTimeout,10);
	}	
	
	$scope.stopTimer = function(){
		$timeout.cancel(mytimeout);
	}

	$scope.startTimer = function(){
		var mytimeout = $timeout($scope.onTimeout,10);
	}	

}