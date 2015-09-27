Package.describe({
  name: 'parlay:after-rendered',
  version: '0.0.1',
  summary: 'Run code once after any instance of the template is rendered, or immediately if already rendered.',
  git: 'https://github.com/parlaywithme/after-rendered',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.0.1');
  api.use([
    'coffeescript',
    'tracker',
    'reactive-var',
    'templating',
    'blaze'
  ], 'client');

  api.addFiles('after-rendered.coffee', 'client');
});

Package.onTest(function(api) {
  api.use([
    'coffeescript',
    'templating',
    'tinytest',
    'parlay:after-rendered'
  ], 'client');

  api.addFiles(['tests.html', 'tests.coffee'], 'client');
});
