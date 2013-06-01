class Efile.Views.ItemView extends Backbone.View

  tagName: 'section'

  template: JST['items/index']

  render: =>
    @$el.html(@template @model.toJSON())
    return @
