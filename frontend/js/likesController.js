angular.module('FiftyFifty')
.controller('LikesController', LikesController);

LikesController.$inject = ['$http', '$rootScope'];

function LikesController($http, $rootScope){
  var self = this;
  self.all = null;
  self.postLikes = postLikes;



  var postLikes = function(){
    var user_id = $rootScope.user.id
    $http
      .get('http://localhost:3000/likes?user_id=' + user_id)
      .then(function(response){
        self.all = response.data;
        console.log(response.data);
        
    });
  }
  postLikes();

}

