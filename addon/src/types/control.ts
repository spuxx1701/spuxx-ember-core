export const ControlSize = {
  square: 'square',
  auto: 'auto',
  small: 'small',
  medium: 'medium',
  large: 'large',
  xLarge: 'x-large',
  max: 'max',
} as const;
export type ControlSize = (typeof ControlSize)[keyof typeof ControlSize];

export const ButtonVariant = {
  primary: 'primary',
  primaryOutline: 'primary-outline',
  secondary: 'secondary',
  secondaryOutline: 'secondary-outline',
  tertiary: 'tertiary',
  tertiaryOutline: 'tertiary-outline',
  tertiaryPlain: 'tertiary-plain',
} as const;
export type ButtonVariant = (typeof ButtonVariant)[keyof typeof ButtonVariant];
