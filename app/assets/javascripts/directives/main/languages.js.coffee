languagesDirective = angular.module('TypingTrainer').directive('languages',($location) ->
  restrict: 'E',
  templateUrl:'/assets/languages.html',
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

    # $scope.selectLanguage = (language) ->
    #   $scope.currentLanguage = language.name
      # $scope.loadLessons = true

    $scope.play = ->
      $scope.loadLanguages = true
    # $location.url('/languages')

    getlanguages()
)

languagesDirective.$inject = ['$scope', '$location', '$http']