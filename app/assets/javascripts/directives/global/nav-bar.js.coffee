navBar = angular.module('TypingTrainer').directive('navBar',($location, $route, Auth) ->
    restrict: 'E',
    templateUrl:'/assets/nav-bar.html',
    controller: ($scope, $route) ->


      Auth.currentUser().then((user) ->
        $scope.isSignedIn = true
        console.log('currentUser: ' + user)
      )

      console.log('Auth ' + Auth.isAuthenticated())
        
      $scope.isSignedIn = Auth.isAuthenticated() 
      $scope.isRegistered = true
      $scope.errors = null

      $scope.login = (user) ->
        Auth.login(user).then((user) ->
          $scope.isSignedIn = true
        , (error) ->
            console.log('ERROR')
            console.log('error: ' + error)  
        ).finally( ->
            $scope.user.email = ''
            $scope.user.password = ''
        )

      $scope.$on('devise:unauthorized',(event, xhr, deferred) ->
        console.log('in listener')
        console.log(xhr.data.error)
        console.log($location.$$path)
        if $location.$$path != ''
          $location.url('/')
          $scope.errors = xhr.data.error

        if xhr.data.error == "Invalid email or password."
          $scope.errors = xhr.data.error
          $scope.user.email = ''
          $scope.user.password = ''
      )


      $scope.logout = ->
        Auth.logout().then( (oldUser) ->
          $scope.isSignedIn = false
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
          $route.reload()
       
          
)     

navBar.$inject = ['$location', '$route', 'Auth', '$scope']
