angular.module('FiftyFifty')
.controller('LoginController', LoginController);

LoginController.$inject = ['$http'];

function LoginController($http){
  var self = this;
  self.all = [];

  self.auth = function(){
    $http
      .post('http://localhost:3000/users/login', 
        {
          "email":self.email,
          "password":self.password
        })

      .then(function(response){
        console.log(response);
      })
  }

}