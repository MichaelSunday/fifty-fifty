angular.module('FiftyFifty')
.controller('GenreController', GenreController);

GenreController.$inject = ['$http'];

function GenreController($http){
  var self = this;
  self.all = [];
  self.getGenres = getGenres;

  var getGenres = function(){
    $http
      .get('http://localhost:3000/genres')
      .then(function(response){
        self.all = response.data.genres;
        console.log(response.data);
    });
  }

  getGenres();

}