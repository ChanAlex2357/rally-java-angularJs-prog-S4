/// Declaration du module rally app
let rally_app = angular.module("RallyApp",["ngRoute"]);
/// Configuration des mappings gerer dans rally app
rally_app.config(['$routeProvider' ,  $routeProvider =>{
    $routeProvider
        .when('/index', {
            templateUrl: 'views/welcome.html'
        })
        .when('/rank/general', {
            templateUrl: 'views/general-rank.html',
            controller: 'FinalRankingController'
        })
        .when('/rank/categorie' , {
            templateUrl: 'views/categorie-rank.html',
            controller: 'CategoryRankController'
        })
        .otherwise({
            redirectTo: '/index'
        });
}]);

rallyApp.filter('formatTime', function() {
    return function(totalTime) {
        const hours = parseInt(totalTime.substring(0, 2));
        const minutes = parseInt(totalTime.substring(3, 5));
        const seconds = parseInt(totalTime.substring(6, 8));
        const milliseconds = parseInt(totalTime.split('.')[1]) / 1000;
        let timeString = '';
        if (hours > 0) {
            timeString += `${hours} heure `;
        }
        if (minutes > 0) {
            timeString += `${minutes} min `;
        }
        if (seconds > 0) {
            timeString += `${seconds} sec `;
        }
        if (milliseconds > 0) {
            timeString += `${milliseconds} millis`;
        }
        return timeString.trim();
    };
});

rallyApp.controller('FinalRankingController', ['$scope', '$http', function ($scope, $http) {
    $http.get('/rally/api/final-ranking').then(response => $scope.rankings = response.data);
}]);

rallyApp.controller('CategoryRankController', ['$scope', '$http', function ($scope, $http) {
    $http.get('/rally/api/category-rank').then(response => $scope.rankings = response.data);
}]);