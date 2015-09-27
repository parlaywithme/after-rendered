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
Template.bar.afterRendered ->
  $('#bar').animate
    opacity: 0
  , 3000
```
