myApp.factory("Feature", function($resource) {
  return $resource("features/:id", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("featuresController", function($scope, Feature) {
  $scope.addFeature = function(plan_id) {
    $scope.planId = plan_id;
    $("#planId").val(plan_id);
    $("#plan_feature").removeClass('ng-hide');
  }

  $scope.updateFeature = function() {
  	$scope.newFeature.planId = $("#planId").val();
    feature = Feature.save($scope.newFeature);
    $("#plan_feature").addClass('ng-hide');
    $scope.plans = Plan.index();
  }
})