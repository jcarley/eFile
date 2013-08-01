appModule.controller 'HomeCtrl', ['$scope', 'itemData', ($scope, itemData) ->
  $scope.items = itemData.items ->
    $(document).foundation('section', 'reflow')
]
