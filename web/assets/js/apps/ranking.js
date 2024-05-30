/// Declaration du module ranking app
let rankingApp = angular.module("RankingApp",["ngRoute"]);
/// Configuration des mappings gerer dans rally app
rankingApp.config(['$routeProvider' ,  $routeProvider =>{
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

rankingApp.filter('formatTime', function() {
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

rankingApp.controller('FinalRankingController', ['$scope', '$http', function ($scope, $http) {
    $http.get('rally/api/finalRank')
        .then (
            response => $scope.rankings = response.data
        );
}]);

rankingApp.controller('CategoryRankController', ['$scope', '$http', function ($scope, $http) {
    $http.get('rally/api/categorieRank')
        .then(
            response => $scope.rankings = response.data
        );
}]);