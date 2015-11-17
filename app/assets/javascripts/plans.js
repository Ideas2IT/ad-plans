myApp.factory("Plan", function($resource) {
  return $resource("plans.json", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("plansController", ['$scope', 'Plan', function($scope, Plan) {
  $scope.plans = Plan.index();

  $scope.addPlan = function() {
    plan = Plan.save($scope.newPlan);
    $scope.plans.push(plan);
    $scope.newPlan = {};
    $("#planForm").addClass('ng-hide');
  };

  $scope.createNewPlan = function() {
    $("#planForm").removeClass('ng-hide');
  };

  $scope.$on("newFeature", function (evt,  features) {
    var plan_id = features[0].plan_id;
    for (var i =0; i < $scope.plans.length;  i++) {
      if ($scope.plans[i].id == plan_id) {
        $scope.plans[i].features = features;
      }
    }
  });

}]);
