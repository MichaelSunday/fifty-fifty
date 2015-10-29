angular
  .module('FiftyFifty', ["ui.router"])
  .config(['$httpProvider', function($httpProvider) {
  	$httpProvider.defaults.xrsfCookieName = "csrftoken";
  	$httpProvider.defaults.xrsfHeaderName = "X-CSRF-Token";

  }]) 
  .config(FiftyRouter);

  function FiftyRouter($stateProvider, $urlRouterProvider){


  $stateProvider
  .state('genres', {
    url: '/genres',
    templateUrl: 'genre.html'
  })
  .state('root', {
    url: '/',
    templateUrl: 'index.html'
  })
  .state('track', {
    url: '/track',
    templateUrl: 'track.html'
  })

  $urlRouterProvider.otherwise("/");

}