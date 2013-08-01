appModule.factory 'itemData', ($resource) ->
  data = $resource '/items'
  items: ->
    data.query()
