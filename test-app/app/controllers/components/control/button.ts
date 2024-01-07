import Ember from 'ember';

export default class Controller extends Ember.Controller {
  private _variants = ['primary', 'secondary', 'tertiary'];

  get variants() {
    return this._variants.map((variant) => {
      return {
        label: variant.charAt(0).toUpperCase() + variant.slice(1),
        value: variant,
      };
    });
  }
}
