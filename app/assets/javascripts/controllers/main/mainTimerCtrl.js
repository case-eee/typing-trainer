function timerCtrl($scope, $timeout) {
	$scope.counter = 0;
	$scope.onTimeout = function(){
		$scope.counter++
		mytimeout = $timeout($scope.onTimeout,10);
	}
	
	var mytimeout = $timeout($scope.onTimeout,10);
	
	$scope.stop = function(){
		$timeout.cancel(mytimeout);
	}
}