myApp.factory("Feature", function($resource) {
  return $resource("features.json", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.factory("Features", function($resource) {
  return $resource("features/:id/:action.json", { id: '@id' }, {
    edit: { method: 'GET' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("featuresController",['$scope', '$rootScope', 'Feature', 'Features',  function($scope, $rootScope, Feature, Features) {
  $scope.addFeature = function(plan_id) {
    $scope.newFeature = {};
    $scope.planId = plan_id;
    $("#planId").val(plan_id);
    $("#plan_feature").removeClass('ng-hide');
    $("#update_plan_feature").addClass('ng-hide');
  }

  $scope.createFeature = function() {
    $scope.newFeature.planId = $("#planId").val();
    feature = Feature.save($scope.newFeature, function(res) {
    	$rootScope.$broadcast("new_feature", res.features);
    }, function(err) {
    	console.error(err);
    });
    $("#plan_feature").addClass('ng-hide');
    $scope.newFeature = {};
  }

  $scope.updateFeature = function() {
    feature = Features.update($scope.newFeature, function(res) {
      $rootScope.$broadcast("new_feature", res.features);
    }, function(err) {
      console.error(err);
    });
    $("#update_plan_feature").addClass('ng-hide');
  }
}])
