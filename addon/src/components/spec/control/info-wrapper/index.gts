import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { type IconName } from '@fortawesome/fontawesome-svg-core';
import './styles.css';
import Button from '../button/index.gts';
import {
  type ControlSize,
  type ButtonVariant,
} from '../../../../types/control.ts';

interface Signature {
  Element: HTMLButtonElement;
  Args: {
    /*
     * The button's icon.
     */
    icon?: IconName;
    /**
     * The total size of the wrapper. Defines the width of the wrapper and the wrapped content. Defaults to 'auto'.
     */
    size?: ControlSize;
    /*
     * The button's variant. Defines what the button looks like. Defaults to 'primary'.
     */
    variant?: ButtonVariant;
    /*
     * Listens to the button's click event.
     */
    onClick?: (event: MouseEvent) => void;
  };
  Blocks: {
    default: [];
    tooltip: [];
    modal: [];
  };
}

export default class InfoWrapper extends Component<Signature> {
  get icon() {
    return this.args.icon ?? 'info';
  }

  get size() {
    return this.args.size ?? 'auto';
  }

  handleClick = (event: MouseEvent) => {
    const { onClick } = this.args;
    if (onClick) {
      onClick(event);
    }
  };

  <template>
    <span class='spec__info-wrapper spec__control-size-{{this.size}}'>
      <span class='spec__info-wrapper-content'>
        {{yield to='default'}}
      </span>
      <Button
        @icon={{this.icon}}
        @onClick={{this.handleClick}}
        @variant={{@variant}}
        @size='square'
        class='spec__info-wrapper-button'
      />
    </span>
  </template>
}
