l = ->
  console.log arguments...

# non-body templates don't exist until after startup
Meteor.startup ->
  Template.forEach (template) ->

    template.hasRendered = new ReactiveVar no

    template.onRendered ->
      template.hasRendered.set yes

    template.afterRendered = (fn) ->
      Tracker.autorun (c) ->
        if template.hasRendered.get()
          # http://stackoverflow.com/questions/32808351/how-can-you-get-all-rendered-instances-of-a-template
          # fn.call instance
          fn()
          c.stop()
      undefined

Template.forEach = (cb) ->
  for key of Template
    if Template.hasOwnProperty key
      template = Template[key]
      if Blaze.isTemplate template

        # skip private templates:
        # Template.__body__ (but includes Template.body)
        # Template.__dynamic
        # Template.__dynamicWithDataContext
        unless key[..1] is '__'

          cb template
