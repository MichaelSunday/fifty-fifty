angular.module('FiftyFifty')
.controller('GenreController', GenreController);

GenreController.$inject = ['$http'];

function GenreController($http){
  var self = this;
  self.all = [];
  self.getGenres = getGenres;

  getGenres();
  function getGenres(){
    $http
      .get('http://localhost:3000/genres/')
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
    });
  }


}