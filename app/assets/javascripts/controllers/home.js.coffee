appModule.controller 'HomeCtrl', ['$scope', 'itemData', ($scope, itemData) ->
  $scope.items = itemData.items()
]
