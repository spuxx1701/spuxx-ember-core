import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { type IconName } from '@fortawesome/fontawesome-svg-core';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import { ButtonVariant } from './types.ts';
import './styles.css';

export * from './types.ts';

interface Signature {
  Element: HTMLButtonElement;
  Args: {
    /*
     * Whether the button is busy or not. If true, than the button will be disabled
     * and a spinner will be shown. The spinner will not be shown if any block content is provided.
     */
    busy: boolean;
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

  handleClick = (event: MouseEvent) => {
    const { onClick } = this.args;
    if (onClick) {
      onClick(event);
    }
  };

  <template>
    <button
      class='spec__button spec__button-{{this.variant}}'
      role='button'
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
