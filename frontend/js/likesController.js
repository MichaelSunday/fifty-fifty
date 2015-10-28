angular.module('FiftyFifty')
.controller('LikesController', LikesController);

LikesController.$inject = ['$http'];

function LikesController($http){
  var self = this;
  self.all = null;
  self.getLikes = getLikes;

  var getTracks = function(){
    $http
      .post('http://localhost:3000/likes/')
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
    });
  }

  getLikes();


  }

}