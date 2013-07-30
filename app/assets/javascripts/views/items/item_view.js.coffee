class App.Views.ItemView extends Backbone.Marionette.ItemView

  id: =>
    @model.get('_id')

  tagName: 'section'

  # template: JST['items/item']
  template: 'items/item'
