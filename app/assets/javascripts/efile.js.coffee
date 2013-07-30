# Backbone.Marionette.TemplateCache.prototype.compileTemplate = (rawTemplate) ->
  # console.log "help", rawTemplate
  # JST[rawTemplate]
  # # Handlebars.compile rawTemplate

  # Handlebars.compile rawTemplate


@App = do (Backbone, Marionette) ->

  Marionette.TemplateCache::compileTemplate = (rawTemplate) ->
    console.log "help", rawTemplate
    JST[rawTemplate]

  App = new Marionette.Application
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}

  App.addRegions
    mainRegion: "#items-row"

  App.on "initialize:before", (options) ->
    view = new App.Views.ItemsView
      collection: options.items
    App.mainRegion.show view

  App

