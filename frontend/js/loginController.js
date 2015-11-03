angular.module('FiftyFifty')
.controller('LoginController', LoginController);

LoginController.$inject = ['$http', '$window', '$rootScope'];

function LoginController($http, $window, $rootScope){
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
        $rootScope.user = response.data;
        $window.location.href = '/#/genres';
      })
  }

  self.reg = function(){
    $http
      .post('http://localhost:3000/users/create', 
      {
        "name":self.name,
        "email":self.email,
        "password_confirmation":self.password_confirmation,
        "password":self.password

      })

      .then(function(response){
        console.log(response);
        $rootScope.user = response.data;
        $window.location.href = '/#/genres';
      })

  }

}
