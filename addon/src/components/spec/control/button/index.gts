import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { type IconName } from '@fortawesome/fontawesome-svg-core';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import {
  type ControlSize,
  type ButtonVariant,
} from '../../../../types/control.ts';
import './styles.css';
import { createClickRipple } from '../../../../utils/animation.ts';

interface Signature {
  Element: HTMLButtonElement;
  Args: {
    /*
     * Whether the button is busy or not. If true, than the button will be disabled
     * and a spinner will be shown. The spinner will not be shown if any block content is provided.
     */
    busy?: boolean;
    /*
     * The button's title. Will also be used as the button's text as as long as no block
     * content is provided.
     */
    title?: string;
    /*
     * The button's icon. Will be shown before the button's text.
     */
    icon?: IconName;
    /*
     * The button's variant. Defines what the button looks like. Defaults to 'primary'.
     */
    variant?: ButtonVariant;
    /**
     * The button's size. Defines the width of the button. Defaults to 'auto'.
     */
    size?: ControlSize;
    /*
     * Listens to the button's click event.
     */
    onClick?: (event: MouseEvent) => void;
  };
  Blocks: {
    default: [];
  };
}

export default class Button extends Component<Signature> {
  get variant() {
    return this.args.variant ?? 'primary';
  }

  get size() {
    return this.args.size ?? 'auto';
  }

  handleClick = (event: MouseEvent) => {
    createClickRipple(event);
    const { onClick } = this.args;
    if (onClick) {
      onClick(event);
    }
  };

  <template>
    <button
      class='spec__control spec__button spec__button-{{this.variant}}
        spec__control-size-{{this.size}}'
      type='button'
      title={{@title}}
      aria-label={{@title}}
      disabled={{@busy}}
      {{on 'click' this.handleClick}}
      ...attributes
    >
      {{#unless (has-block 'default')}}
        {{#unless @busy}}
          {{#if @icon}}
            <FaIcon class='spec__button-icon' @icon={{@icon}} />
          {{/if}}
        {{else}}
          <FaIcon class='spec__button-icon' @icon='spinner' @spin={{true}} />
        {{/unless}}
        <p class='spec__button-text'>{{@title}}</p>
      {{else}}
        {{yield}}
      {{/unless}}
    </button>
  </template>
}
