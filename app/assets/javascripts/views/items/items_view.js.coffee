class Efile.Views.ItemsView extends Backbone.View
  el: '#items'
  items: {}

  initialize: ->
    @listenTo(@collection, 'add', @addItem)

  addItem: (model) ->
    @items[model.id] = new Efile.Views.ItemView model: model
    @$el.append(@items[model.id].render().$el)
