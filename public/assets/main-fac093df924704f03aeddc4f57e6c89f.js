(function() {
  var TypingTrainer;

  TypingTrainer = angular.module('TypingTrainer', ['ngRoute']);

  TypingTrainer.config([
    '$routeProvider', function($routeProvider) {
      $routeProvider.when('/lessons/:lessonId', {
        templateUrl: '../assets/mainScripts.html',
        controller: 'ScriptsCtrl'
      }).when('/tracks', {
        templateUrl: '../assets/mainTracks.html',
        controller: 'TracksCtrl'
      }).when('/tracks/:trackName', {
        templateUrl: '../assets/mainLessons.html',
        controller: 'LessonCtrl'
      }).when('/post/new', {
        templateUrl: '../assets/mainCreatePost.html',
        controller: 'CreatePostCtrl'
      }).when('/post/:postId', {
        templateUrl: '../assets/mainPost.html',
        controller: 'PostCtrl'
      }).when('/gameplay', {
        templateUrl: '../assets/mainGamePlay.html',
        controller: 'GamePlayCtrl'
      });
      return $routeProvider.otherwise({
        templateUrl: '../assets/mainIndex.html',
        controller: 'IndexCtrl'
      });
    }
  ]);

  TypingTrainer.config([
    "$httpProvider", function(provider) {
      return provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }
  ]);

}).call(this);
(function() {


}).call(this);
(function() {
  angular.module('TypingTrainer').factory('postData', [
    '$http', function($http) {
      var postData;
      postData = {
        data: {
          posts: [
            {
              title: 'Loading',
              contents: ''
            }
          ]
        },
        isLoaded: false
      };
      postData.loadPosts = function(deferred) {
        if (!postData.isLoaded) {
          return $http.get('./posts.json').success(function(data) {
            postData.data.posts = data;
            postData.isLoaded = true;
            console.log('Successfully loaded posts.');
            if (deferred) {
              return deferred.resolve();
            }
          }).error(function() {
            console.error('Failed to load posts.');
            if (deferred) {
              return deferred.reject('Failed to load posts.');
            }
          });
        } else {
          if (deferred) {
            return deferred.resolve();
          }
        }
      };
      postData.createPost = function(newPost) {
        var data;
        if (newPost.newPostTitle === '' || newPost.newPostContents === '') {
          alert('Neither the Title nor the Body are allowed to be left blank.');
          return false;
        }
        data = {
          new_post: {
            title: newPost.newPostTitle,
            contents: newPost.newPostContents
          }
        };
        $http.post('./posts.json', data).success(function(data) {
          postData.data.posts.push(data);
          return console.log('Successfully created post.');
        }).error(function() {
          return console.error('Failed to create new post.');
        });
        return true;
      };
      return postData;
    }
  ]);

}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);
(function() {
  this.CreatePostCtrl = function($scope, $location, postData) {
    $scope.data = postData.data;
    postData.loadPosts(null);
    $scope.formData = {
      newPostTitle: '',
      newPostContents: ''
    };
    $scope.navNewPost = function() {
      return $location.url('/post/new');
    };
    $scope.navHome = function() {
      return $location.url('/');
    };
    $scope.createPost = function() {
      return postData.createPost($scope.formData);
    };
    return $scope.clearPost = function() {
      $scope.formData.newPostTitle = '';
      return $scope.formData.newPostContents = '';
    };
  };

  this.CreatePostCtrl.$inject = ['$scope', '$location', 'postData'];

}).call(this);
(function() {
  this.GamePlayCtrl = function($scope) {
    return $scope.restart = function() {
      return $location.url('/gameplay');
    };
  };

  this.GamePlayCtrl.$inject = ['$scope'];

}).call(this);
(function() {
  this.IndexCtrl = function($scope, $location, $http, postData) {
    return $scope.play = function() {
      $location.url('/tracks');
      return $scope.navNewPost = function() {
        return $location.url('/post/new');
      };
    };
  };

  this.IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData'];

}).call(this);
(function() {
  this.LessonCtrl = function($scope, $location, $http, $routeParams) {
    var getLessons, trackName;
    $scope.lessons = [
      {
        lesson_id: "Loading..."
      }
    ];
    trackName = $routeParams.trackName;
    getLessons = function() {
      var data;
      data = $routeParams;
      return $http.get('./lessons/' + trackName + '.json', data).success(function(data) {
        $scope.lessons = data;
        return console.log('Successfully loaded lessons.');
      }).error(function() {
        return console.error('Failed to load lessons.');
      });
    };
    $scope.selectLesson = function(lesson) {
      return $location.url('lessons/' + lesson);
    };
    return getLessons();
  };

  this.LessonCtrl.$inject = ['$scope', '$location', '$http', '$routeParams'];

}).call(this);
(function() {
  this.PlayCtrl = function($scope, $http) {
    var getScript;
    return getScript = function() {
      return $http.get();
    };
  };

  this.PlayCtrl.$inject = ['$scope', '$http'];

}).call(this);
(function() {
  this.PostCtrl = function($scope, $routeParams, $location, $q, postData) {
    $scope.data = {
      postData: postData.data,
      currentPost: {
        title: 'Loading...',
        contents: ''
      }
    };
    $scope.data.postId = $routeParams.postId;
    $scope.prepPostData = function() {
      var post;
      post = _.findWhere(postData.data.posts, {
        id: parseInt($scope.data.postId)
      });
      $scope.data.currentPost.title = post.title;
      return $scope.data.currentPost.contents = post.contents;
    };
    $scope.navNewPost = function() {
      return $location.url('/post/new');
    };
    $scope.navHome = function() {
      return $location.url('/');
    };
    this.deferred = $q.defer();
    this.deferred.promise.then($scope.prepPostData);
    return postData.loadPosts(this.deferred);
  };

  this.PostCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'postData'];

}).call(this);
(function() {
  this.ScriptsCtrl = function($scope, $location, $http, $routeParams) {
    var getScripts, lessonId;
    $scope.scripts = [
      {
        text: "Loading..."
      }
    ];
    lessonId = $routeParams.lessonId;
    getScripts = function() {
      var data;
      data = $routeParams;
      return $http.get('./scripts/' + lessonId + '.json', data).success(function(data) {
        $scope.scripts = data;
        return console.log('Successfully loaded scripts.');
      }).error(function() {
        return console.error('Failed to load scripts.');
      });
    };
    $scope.selectScript = function(script) {
      return $location.url('/gameplay');
    };
    return getScripts();
  };

  this.ScriptsCtrl.$inject = ['$scope', '$location', '$http', '$routeParams'];

}).call(this);
(function() {
  this.TracksCtrl = function($scope, $location, $http) {
    var getTracks;
    $scope.tracks = [
      {
        name: 'Loading...'
      }
    ];
    getTracks = function() {
      return $http.get('./languages.json').success(function(data) {
        $scope.tracks = data;
        return console.log('Successfully loaded tracks.');
      }).error(function() {
        return console.error('Failed to load tracks.');
      });
    };
    $scope.selectTrack = function(track) {
      return $location.url('tracks/' + track);
    };
    return getTracks();
  };

  this.TracksCtrl.$inject = ['$scope', '$location', '$http'];

}).call(this);
angular.module('TypingTrainer').directive('navBar', ['$location', function($location){
	return {
		restrict: 'E',
		templateUrl: '/assets/nav-bar.html'
		// controller: 
	}
}])
;
(function() {


}).call(this);
