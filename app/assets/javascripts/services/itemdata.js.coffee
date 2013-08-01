appModule.factory 'itemData', ($resource) ->
  data = $resource '/items'
  items: (callback) ->
    data.query ->
      callback()
