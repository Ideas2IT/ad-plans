myApp.factory("Plan", function($resource) {
  return $resource("plans.json", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("plansController", ['$scope', 'Plan', function($scope, Plan) {
  $scope.plans = Plan.index()
}]);
