import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { ControlSize, ButtonVariant } from '@spuxx/ember-core';
import ENV from 'test-app/config/environment';

export default class ButtonRouteController extends Controller {
  private _variants = Object.values(ButtonVariant);
  private _sizes = Object.values(ControlSize);

  get variants() {
    return this._variants.map((variant) => {
      return {
        label: variant.charAt(0).toUpperCase() + variant.slice(1),
        value: variant,
      };
    });
  }

  get sizes() {
    return this._sizes.map((size) => {
      return {
        label: size,
        value: size,
      };
    });
  }

  @tracked busy = false;

  setBusy = async () => {
    this.busy = true;
    const delay = ENV.environment === 'test' ? 10 : 1000;
    await new Promise((resolve) => setTimeout(resolve, delay));
    this.busy = false;
  };
}
