Run the given function once after any instance of the template is rendered, or immediately if an instance has already been rendered. Unlike `onRendered`, the function is *not* executed in the context of the instance.

```html
<body>
  {{> foo}}
</body>

<template name="foo">
  <div id="bar">
    bar
  </div>
</template>
```

```coffeescript
animateBar = (opacity) ->
  Template.bar.afterRendered ->
    $('#bar').animate {opacity}, 3000

animateBar 0

setTimeout ->
  animateBar 1
, 10 * 1000
```

The bar is animated twice: once when the first `bar` template is rendered, and once 10 seconds after pageload.
