navBar = angular.module('TypingTrainer').directive('navBar',($location, Auth) ->
    restrict: 'E',
    templateUrl:'/assets/nav-bar.html',
    controller: ($scope) ->
      $scope.isSignedIn = Auth.isAuthenticated()
      console.log('isSignedIn:' + $scope.isSignedIn)
      $scope.isRegistered = true
      $scope.errors = null

      $scope.login = (user) ->
        Auth.login(user).then((user) ->
          console.log('logged in')
          $scope.isSignedIn = true
        , (error) ->
            console.log('ERROR')
            console.log('error: ' + error)  
        )
       
        $scope.$on('devise:unauthorized',(event, xhr, deferred) ->
          console.log(event)
          $scope.user.email = ''
          $scope.user.password = ''
          $scope.errors = "Invalid email or password" 
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
        , (error) ->
            console.log(error)
            if error.data.errors.email
              $scope.errors = "User already registered"
            else if error.data.errors.password_confirmation
              $scope.errors = "Passwords don't match"
        ).finally( ->  
          $scope.newUser.password = ''
          $scope.newUser.password_confirmation = ''
        )

        $scope.home = ->
          $location.url('../assets/mainIndex.html')
       
          
)     

navBar.$inject = ['$location', 'Auth', '$scope']
