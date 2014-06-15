angular.module('TypingTrainer').factory('scriptData', ['$http', ($http) ->

  scriptData =
    data:
      text: [{text: 'Loading'}]
    isLoaded: false

  scriptData.getScripts = (deferred) ->
    if !scriptData.isLoaded
      $http.get('./' + scriptId + '/gameplay').success( (data) ->
      	scriptData.data.text = data
        scriptData.isLoaded = true
        console.log('Successfully loaded text.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load text.')
        if deferred
          deferred.reject('Failed to load text.')
      )
    else
      if deferred
        deferred.resolve()

  return scriptData
  
])