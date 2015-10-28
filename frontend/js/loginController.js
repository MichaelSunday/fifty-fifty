angular.module('FiftyFifty')
.controller('LoginController', LoginController);

LoginController.$inject = ['$http'];

function LoginController($http){
  var self = this;
  self.all = [];
  self.getGenres = getGenres;

  var getLogin = function(){
    $http
      .get('http://localhost:3000/users/login')
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
    });
  }

  getLogin();

}