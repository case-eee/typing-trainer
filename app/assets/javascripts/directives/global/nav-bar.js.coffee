navBar = angular.module('TypingTrainer').directive('navBar',($location, Auth) ->
    restrict: 'E',
    templateUrl:'/assets/nav-bar.html',
    controller: ($scope) ->
      $scope.isSignedIn = Auth.isAuthenticated()
      console.log('isSignedIn:' + $scope.isSignedIn)
      $scope.isRegistered = true

      $scope.login = (user) ->
        Auth.login(user).then((user) ->
          console.log('logged in')
          $scope.isSignedIn = true
          $scope.user.email = ''
          $scope.user.password = ''
        , (error) ->
            console.log(error)   
        )


      $scope.logout = ->
        Auth.logout().then( (oldUser) ->
          $scope.isSignedIn = Auth.isAuthenticated()
          console.log($scope.isSignedIn)
          console.log('logged out')
          $location.url('/')
        , (error) ->
          console.log(error)
        )
            
      $scope.register = (user) ->
        Auth.register(user).then((registeredUser) ->
          console.log('registered')
          $scope.isRegistered = true
          $scope.isSignedIn = true
          $scope.newUser.email = ''
          $scope.newUser.password = ''
          $scope.newUser.password_confirmation = ''
        , (error) ->
            console.log(error)
        )  

        $scope.home = ->
          $location.url('../assets/mainIndex.html')
       
          
)     

navBar.$inject = ['$location', 'Auth', '$scope']
