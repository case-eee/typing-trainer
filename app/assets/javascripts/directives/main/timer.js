angular.module('TypingTrainer').directive('ngtimer', ['$location', function ($timeout) {
return {
  restrict: 'AE',
  replace: 'true',
  template: '<span>Hello?{{countUp}}{{color}}</span>',
  link: function (scope, elem) {
    elem.bind('click', function () {
      scope.countUp = 0
      scope.onTimeout = function () {
        scope.counterUp++;
        scope.mytimeout = $timeout(onTimeout, 10);
      };
      scope.$apply(function(){
          scope.color="white";
      });
      scope.stop = function () {
        $timeout.cancel(scope.mytimeout)
      }
    });

  }
}
}]);