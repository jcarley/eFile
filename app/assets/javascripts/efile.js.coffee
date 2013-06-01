window.Efile =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    items = new Efile.Collections.Items()
    items.fetch()

    itemsView = new Efile.Views.ItemsView
      collection: items
    itemsView.render()
    $(this).foundation('section', 'reflow')

$(document).ready ->
  Efile.initialize()
