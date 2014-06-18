sidebar = angular.module('TypingTrainer').directive('sidebar',() ->
  restrict: 'E',
  templateUrl:'/assets/sidebar.html',
  controller: ($scope, $http, scriptData) ->
    $scope.showLanguages = true
    $scope.showLessons = false
    $scope.showScripts = false

    getlanguages = ->
      $http.get('./languages.json').success( (data) ->
        $scope.languages = data
        console.log('Successfully loaded languages.')
        console.log('languages: ' + $scope.languages)
      ).error( ->
        console.error('Failed to load languages.')
      )

    $scope.getLessons = (language)->
      $http.get('./lessons/' + language + '.json').success( (data) ->
        console.log(data)
        $scope.lessons = data
        # $scope.loadLessons = true
        $scope.showLessons = true
        $scope.showLanguages = false
        console.log('Successfully loaded lessons.')
      ).error( ->
        console.error('Failed to load lessons.')
      )

    $scope.getScripts = (lessonId) ->
      scripts = _.where(scriptData.data.scripts, { lesson_id: parseInt(lessonId) })
      console.log(scripts)
      $scope.scripts = scripts
      $scope.showLessons = false
      $scope.showScripts = true

    getlanguages()
)

sidebar.$inject = ['$scope', '$location', '$http']