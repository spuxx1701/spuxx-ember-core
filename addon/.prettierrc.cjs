'use strict';

module.exports = {
  plugins: ['prettier-plugin-ember-template-tag'],
  overrides: [
    {
      files: '*.{gjs,gts}',
      options: {
        parser: 'ember-template-tag',
      },
    },
  ],
  singleQuote: true,
};
