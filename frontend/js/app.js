angular
  .module('FiftyFifty', ["ui.router"])
  .config(['$httpProvider', function($httpProvider) {
  	$httpProvider.defaults.xrsfCookieName = "csrftoken";
  	$httpProvider.defaults.xrsfHeaderName = "X-CSRF-Token";

  }]) 
  .config(FiftyRouter);

  function FiftyRouter($stateProvider, $urlRouterProvider){


  $stateProvider
  .state('root', {
    url: '/',
    templateUrl: 'home.html'
  })  
  .state('genres', {
    url: '/genres',
    templateUrl: 'genre.html'
  })

  .state('track', {
    url: '/track',
    templateUrl: 'track.html'
  })

  .state('likes', {
    url: '/likes',
    templateUrl: 'likes.html'
  })

  $urlRouterProvider.otherwise("/");

}