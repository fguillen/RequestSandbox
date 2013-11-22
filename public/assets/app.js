console.log("app.js loading...");

var App = angular.module("App", []);

App.controller( "RequestsController", function($scope, $http) {
  DATA.scope = $scope;

  $scope.requests = DATA.requests;
  $scope.ping_url = DATA.ping_url;
  $scope.key = DATA.key;

  $scope.ping =
    function(){
      $http({method: "GET", url: $scope.ping_url}).
        success(function(){
          console.log("ping sent to " + $scope.ping_url);
        });
    };

});

function reset_data(){
  console.log("reset_data ...");

  $.get(
    DATA.js_url,
    function(data){
      _.each(data, function(request){
        if( !_.any(DATA.requests, function(element){ return element.id == request.id }) ) {
          DATA.requests.unshift(request);
          DATA.scope.$apply();
        }
      });
    }
  );
}

window.setInterval(reset_data, 1000);