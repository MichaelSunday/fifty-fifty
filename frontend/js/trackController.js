angular.module('FiftyFifty')
.controller('TrackController', TrackController);

TrackController.$inject = ['$http'];

function TrackController($http){
  var self = this;
  var query = window.location.search.substring(1);
  var queries = query.split("=");
  self.query = queries[1]
  console.log(self.query);
  self.all = null;
  self.getTracks = getTracks;

  var getTracks = function(){
    $http
      .post('http://localhost:3000/tracks/' + self.query)
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
        playTrack(response.data.preview_url);
    });
  }

  getTracks();

  var playTrack = function(track){
    var song = new Audio(track);
    song.play();
  }

}