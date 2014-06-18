@IndexCtrl = ($scope, $location, $http, postData) ->

  $scope.loadLanguages = false
 # $scope.data = postData.data

 # postData.loadPosts(null)

 @IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']