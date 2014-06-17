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
      }).when('/gameplay/:scriptId', {
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
  angular.module('TypingTrainer').factory('scriptData', [
    '$http', function($http) {
      var scriptData;
      scriptData = {
        data: {
          scripts: [
            {
              text: 'Loading'
            }
          ]
        },
        isLoaded: false
      };
      scriptData.getScripts = function(deferred) {
        if (!scriptData.isLoaded) {
          return $http.get('./scripts.json').success(function(data) {
            scriptData.data.scripts = data;
            scriptData.isLoaded = true;
            console.log('Successfully loaded all scripts.');
            if (deferred) {
              return deferred.resolve();
            }
          }).error(function() {
            console.error('Failed to load all scripts.');
            if (deferred) {
              return deferred.reject('Failed to load all scripts.');
            }
          });
        } else {
          if (deferred) {
            return deferred.resolve();
          }
        }
      };
      return scriptData;
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
  this.GamePlayCtrl = function($scope, $location, $http, $routeParams, $q, scriptData) {
    var markBGRed, moveCursor;
    $scope.$on("my:keypress", function(event, keyEvent) {
      return $scope.listen(keyEvent);
    });
    $scope.typos = 0;
    $scope.counter = 0;
    $scope.totalKeypress = 0;
    $scope.startTime = new Date();
    $scope.endTime;
    $scope.time_elapsed;
    $scope.CPS;
    $scope.charList;
    $scope.finished = false;
    $scope.script = {
      currentScript: {
        text: 'Loading...',
        id: ''
      }
    };
    $scope.scriptId = $routeParams.scriptId;
    $scope.prepScriptData = function() {
      var script;
      script = _.findWhere(scriptData.data.scripts, {
        id: parseInt($scope.scriptId)
      });
      $scope.script.currentScript.text = script.text;
      return $scope.script.currentScript.id = script.id;
    };
    this.deferred = $q.defer();
    this.deferred.promise.then($scope.prepScriptData);
    scriptData.getScripts(this.deferred);
    $scope.sendData = function() {
      var completionData;
      $scope.cps = $scope.totalKeypress / (($scope.endTime - $scope.startTime) / 1000);
      $scope.time_elapsed = new Date(($scope.endTime - $scope.startTime) / 1000);
      completionData = {
        new_performance: {
          number_missed: $scope.typos,
          total_characters: $scope.charList.length,
          time_elapsed: $scope.time_elapsed,
          wpm: $scope.cps,
          script_id: $scope.scriptId
        }
      };
      $http.post('./performances.json', completionData).success(function(data) {
        return console.log("Successfully sent data.");
      }).error(function() {
        return console.error('Failed to create new post.');
      });
      $scope.finished = true;
      console.log("Total Keypress: " + $scope.totalKeypress);
      console.log("Total $scope.charList.length: " + $scope.charList.length);
      console.log("$scope.typos:" + $scope.typos);
      console.log("Total time: " + (($scope.endTime - $scope.startTime) / 1000));
      return console.log("Total $scope.CPS(chars per second): " + ($scope.totalKeypress / (($scope.endTime - $scope.startTime) / 1000)));
    };
    markBGRed = function() {
      return $(".cursor").css("color", "red");
    };
    moveCursor = function() {
      $("code span:nth-child(" + $scope.counter + ")").removeClass('cursor');
      return $("code span:nth-child(" + ($scope.counter + 1) + ")").addClass('cursor');
    };
    $scope.getChars = function() {
      return $scope.charList = $scope.script.currentScript.text.split("");
    };
    $scope.restart = function(scriptId) {
      console.log(scriptId);
      return $location.url('/gameplay/' + scriptId);
    };
    $scope.addClassTyped = function() {
      $("code span:nth-child(" + $scope.counter + ")").removeClass('untyped');
      return $("code span:nth-child(" + $scope.counter + ")").addClass('typed');
    };
    $scope.isComplete = function() {
      if ($scope.counter === $scope.charList.length) {
        $scope.endTime = new Date();
        return $scope.sendData();
      }
    };
    $scope.newCheck = function(keypress) {
      var characters;
      characters = $scope.getChars();
      if (keypress === characters[$scope.counter]) {
        $scope.counter++;
        $scope.addClassTyped();
        return moveCursor();
      } else {
        markBGRed();
        return $scope.typos++;
      }
    };
    return $scope.listen = function(event) {
      event.preventDefault();
      $scope.totalKeypress++;
      $scope.newCheck(String.fromCharCode(event.which));
      return $scope.isComplete();
    };
  };

  this.GamePlayCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', '$q', 'scriptData'];

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
    return getScript = function() {};
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
  this.ScriptsCtrl = function($scope, $location, $http, $routeParams, scriptData, $q) {
    $scope.scripts = {
      currentScripts: [
        {
          text: 'Loading...'
        }
      ]
    };
    $scope.lessonId = $routeParams.lessonId;
    $scope.prepLessonScripts = function() {
      var scripts;
      console.log(scriptData.data.scripts);
      console.log($scope.lessonId);
      scripts = _.where(scriptData.data.scripts, {
        lesson_id: parseInt($scope.lessonId)
      });
      console.log(scripts);
      return $scope.scripts.currentScripts = scripts;
    };
    $scope.selectScript = function(script) {
      return $location.url('/gameplay/' + script);
    };
    this.deferred = $q.defer();
    this.deferred.promise.then($scope.prepLessonScripts);
    return scriptData.getScripts(this.deferred);
  };

  this.ScriptsCtrl.$inject = ['$scope', '$location', '$http', '$routeParams', 'scriptData', '$q'];

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
