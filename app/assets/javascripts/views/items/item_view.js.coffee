class Efile.Views.ItemView extends Backbone.View

  id: =>
    @model.get('_id')

  tagName: 'section'

  template: JST['items/index']

  render: =>
    @$el.html(@template @model.toJSON())
    return @
