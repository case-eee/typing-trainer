@TracksCtrl = ($scope, $location, $http) ->
	$scope.tracks = [{name: 'Loading...'}]

	getTracks = ->
		$http.get('./languages.json').success( (data) ->
			$scope.tracks = data
			console.log('Successfully loaded tracks.')
		).error( ->
			console.error('Failed to load tracks.')
		)

	$scope.selectTrack = (track) ->
		$location.url('tracks/' + track)

	getTracks()

@TracksCtrl.$inject = ['$scope', '$location', '$http']