angular.module('TypingTrainer').factory('scriptData', ['$http', ($http) ->

  scriptData =
    data:
      scripts: [{text: 'Loading'}]
    isLoaded: false

  scriptData.getScripts = (deferred) ->
    if !scriptData.isLoaded
      $http.get('./scripts.json').success( (data) ->
        scriptData.data.scripts = data
        scriptData.isLoaded = true
        console.log('Successfully loaded all scripts.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load all scripts.')
        if deferred
          deferred.reject('Failed to load all scripts.')
      )
    else
      if deferred
        deferred.resolve()

  return scriptData

  
])