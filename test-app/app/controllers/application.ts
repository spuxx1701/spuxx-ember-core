import ENV from 'test-app/config/environment';
import Controller from '@ember/controller';

export default class ApplicationController extends Controller {
  get environment() {
    return ENV.environment;
  }
}
