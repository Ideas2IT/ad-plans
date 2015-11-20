myApp.factory("Plan", function($resource) {
  return $resource("plans.json", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.factory("Plans", function($resource) {
  return $resource("plans/:id/:action.json", { id: '@id' }, {
    edit: { method: 'GET' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("plansController", ['$scope', 'Plan', 'Plans', function($scope, Plan, Plans) {
  $scope.plans = Plan.index();
  $scope.newFeature = {};

  $scope.addPlan = function() {
    plan = Plan.save($scope.newPlan);
    $scope.plans.push(plan);
    $scope.newPlan = {};
    $("#planForm").addClass('ng-hide');
  };

  $scope.createNewPlan = function() {
    $scope.newPlan = {};
    $("#planForm").removeClass('ng-hide');
  };

  $scope.$on("new_feature", function (evt,  features) {
    var plan_id = features[0].plan_id;
    for (var i =0; i < $scope.plans.length;  i++) {
      if ($scope.plans[i].id == plan_id) {
        $scope.plans[i].features = features;
      }
    }
  });

  $scope.editFeature = function(planId) {
    plan = Plans.edit({ id: planId, action: 'edit' },function(res){
      features = [];
      newFeature = {};
      features = res.features;
      for (var i =0; i < features.length;  i++) {
        if (features[i].name == "sms") {
          newFeature.sms = features[i].limit;
        } else if(features[i].name == "email"){
          newFeature.email = features[i].limit;
        } else if(features[i].name == "post"){
          newFeature.post = features[i].limit;
        }
        newFeature.id = res.id;
        newFeature.planId = res.id;
        newFeature.planName = res.name;
      }
      $scope.newFeature = newFeature;
      $("#plan_feature").addClass('ng-hide');
      $("#update_plan_feature").removeClass('ng-hide');
    });
  };

  $scope.editPlan = function(planId) {
    $scope.newPlan = Plans.edit({ id: planId, action: 'edit' });
    $("#planForm").addClass('ng-hide');
  }

  $scope.updatePlan = function() {
    plan = Plans.update($scope.newPlan);
    $scope.plans.push(plan);
    $scope.newPlan = {};
  };

}]);
