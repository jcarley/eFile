class Efile.Views.ItemsView extends Backbone.View
  el: '#items'
  items: {}

  initialize: ->
    @listenTo(@collection, 'add', @addItem)
    @listenTo(@collection, 'remove', @removeItem)
    @listenTo(@collection, 'change', @updateItem)

  addItem: (model) ->
    id = model.get('_id')
    @items[id] = new Efile.Views.ItemView model: model
    @$el.append(@items[id].render().$el)
    @reflow()
    return @

  removeItem: (model, collection, options) ->
    id = model.get('_id')
    index = options.index
    @items[id].remove()
    @items[id] = null
    if index < collection.length
      newId = collection.at(index).get('_id')
      @items[newId].$el.find('p').trigger('click')
    @reflow()
    return @

  updateItem: (model) ->
    id = model.get('_id')
    @items[id] = new Efile.Views.ItemView model: model
    @$("section##{id}").before(@items[id].render().$el).remove()
    @reflow()
    return @

  reflow: ->
    $(document).foundation('section', 'reflow')

