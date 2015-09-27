Tinytest.add 'can see', (t) ->
  t.equal typeof(Template.forEach), 'function'

Tinytest.addAsync 'works later', (t, next) ->
  called = no

  Template.foo.afterRendered ->
    called = yes

  setTimeout ->
    # TODO how to get foo to be rendered in the test client?
    # t.equal called, yes
    next()
  , 1000
