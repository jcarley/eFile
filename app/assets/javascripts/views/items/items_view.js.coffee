class App.Views.ItemsView extends Backbone.Marionette.CompositeView
  # template: JST['items/items']
  template: "items/items"
  itemView: App.Views.ItemView
  itemViewContainer: '#items'

  onAfterItemAdded: (itemView) ->
    @reflow()

  onItemRemoved: (itemView) ->
    @reflow

  reflow: ->
    $(document).foundation('section', 'reflow')

