/// Declaration du module rally app
let rally_app = angular.module("RallyApp",["ngRoute"]);
/// Configuration des mappings gerer dans rally app
rally_app.config(['$routeProvider' ,  $routeProvider =>{
    $routeProvider
        .when('/index', {
            templateUrl: 'views/welcome.html'
        })
        .when('/rank/general', {
            templateUrl: 'views/general-rank.html'
        })
        .when('/rank/categorie' , {
            templateUrl: 'views/categorie-rank.html'
        })
        .otherwise({
            redirectTo: '/index'
        });
}]);