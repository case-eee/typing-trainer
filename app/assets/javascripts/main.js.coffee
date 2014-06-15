# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./services/global
#= require_tree ./services/main
#= require_tree ./filters/global
#= require_tree ./filters/main
#= require_tree ./controllers/global
#= require_tree ./controllers/main
#= require_tree ./directives/global
#= require_tree ./directives/main


TypingTrainer = angular.module('TypingTrainer', ['ngRoute'])


TypingTrainer.config(['$routeProvider', ($routeProvider) -> 
  # Routes for '/post/'
  $routeProvider
    .when('/lessons/:lessonId', { templateUrl: '../assets/mainScripts.html', controller: 'ScriptsCtrl'})
    .when('/tracks', { templateUrl: '../assets/mainTracks.html', controller: 'TracksCtrl'})
    .when('/tracks/:trackName', {templateUrl: '../assets/mainLessons.html', controller: 'LessonCtrl'})
    .when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl' })
    .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' })
    .when('/gameplay/:scriptId', {templateUrl: '../assets/mainGamePlay.html', controller: 'GamePlayCtrl'} )

  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl'} )
])

TypingTrainer.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
