import Component from '@glimmer/component';
import './styles.css';

interface Signature {
  Element: HTMLHRElement;
  Args: {
    direction: 'horizontal' | 'vertical';
  };
}

export default class Divider extends Component<Signature> {
  get direction() {
    return this.args.direction ?? 'horizontal';
  }
  <template>
    <hr class='spec__divider spec__divider-{{this.direction}}' ...attributes />
  </template>
}
