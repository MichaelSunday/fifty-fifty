angular.module('FiftyFifty')
.controller('TrackController', TrackController);

TrackController.$inject = ['$http', '$rootScope'];

function TrackController($http, $rootScope){
  var self = this;

  self.all = null;
  self.getTracks = getTracks;

  console.log($rootScope.user);

  var getTracks = function(){

    var query = window.location.hash.substring(1);
    var queries = query.split("=");
    self.query = queries[1]

    console.log(self.query)
    $http
      .post('http://localhost:3000/tracks/' + self.query)
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
        playTrack(response.data.preview_url);
    });

  }

    self.postLikes = function(){
      var user_id = $rootScope.user.id
      var spotify_id = self.all.artists[0].id;
    $http
      .post('http://localhost:3000/likes/',{
        "user_id":user_id,
        "spotify_id":spotify_id
      })
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
        playTrack(response.data.preview_url);
    });
  }    


    self.postDislikes = function(){
      var user_id = $rootScope.user.id
      var spotify_id = self.all.artists[0].id;
    $http
      .post('http://localhost:3000/likes/',{
        "user_id":user_id,
        "spotify_id":spotify_id
      })
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
        playTrack(response.data.preview_url);
    });
  }

  getTracks();

  var playTrack = function(track){
    if (!!self.song) {
      self.song.pause()

    }
    self.song = new Audio(track);
    self.song.play();
  }

}