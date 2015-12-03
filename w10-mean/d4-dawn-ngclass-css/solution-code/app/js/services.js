angular.module('Awwward')
  .factory('globalAlertService', ['$rootScope', function($rootScope) {
    var globalAlertService = {};

    // create an array of alerts available globally
    $rootScope.alerts = [];

    globalAlertService.add = function(type, msg) {
      $rootScope.alerts.push({'type': type, 'msg': msg, 'close': globalAlertService.closeAlert(this)});
    };

    globalAlertService.closeAlert = function(alert) {
    	console.log("closing alert");
      var index = $rootScope.alerts.indexOf(alert);
      $rootScope.alerts.splice(index, 1);
    };

    return globalAlertService;
  }]);
