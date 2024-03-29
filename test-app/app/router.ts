import EmberRouter from '@ember/routing/router';
import config from 'test-app/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  // Add route declarations here
  this.route('components', function () {
    this.route('control', function () {
      this.route('button');
      this.route('info-wrapper');
    });
  });
});
