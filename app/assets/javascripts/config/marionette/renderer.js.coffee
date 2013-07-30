do (Marionette) ->
  _.extend Marionette.Renderer,

    lookups: ["views/"]

    render: (template, data) ->
      path = @getTemplate(template)
      # path = ""
      console.log "template", template
      console.log "data", data
      throw "Template #{template} not found!" unless path
      path(data)

    getTemplate: (template) ->
      for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
        console.log "path", path
        for lookup in @lookups
          console.log lookup + path
          return JST[lookup + path] if JST[lookup + path]
