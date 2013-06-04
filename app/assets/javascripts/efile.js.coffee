window.Efile =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    window.items = new Efile.Collections.Items()
    window.items.fetch()

    itemsView = new Efile.Views.ItemsView
      collection: items
    itemsView.render()

$(document).ready ->
  Efile.initialize()
