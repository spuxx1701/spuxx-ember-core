import { test, expect } from 'tests/helpers/fixtures';

test('should properly render all variants', async ({ page }) => {
  await page.goto('http://localhost:4200/components/control/button');

  const primaryButton = page
    .locator('.spec__button-primary', { hasText: 'Primary' })
    .first();
  const secondaryButton = page
    .locator('.spec__button-secondary', { hasText: 'Secondary' })
    .first();
  const tertiaryButton = page
    .locator('.spec__button-tertiary', { hasText: 'Tertiary' })
    .first();

  await expect(primaryButton).toBeVisible();
  await expect(secondaryButton).toBeVisible();
  await expect(tertiaryButton).toBeVisible();
});

test('should properly render disabled and busy states', async ({ page }) => {
  await page.goto('http://localhost:4200/components/control/button');

  const disabledButton = page.locator('button', {
    hasText: 'Primary (disabled)',
  });
  await expect(disabledButton).toBeVisible();
  await expect(disabledButton).toBeDisabled();

  const busyButton = page.locator('button', {
    hasText: 'Primary (busy)',
  });
  await expect(busyButton).toBeVisible();
  await expect(busyButton).toBeDisabled();
  await expect(busyButton.locator('.fa-spinner')).toBeVisible();
});

test('should properly change and display the current busy state', async ({
  page,
}) => {
  await page.goto('http://localhost:4200/components/control/button');

  const submitButton = page.locator('button', {
    hasText: 'Primary Submit Button (with icon)',
  });
  const submitButtonIcon = submitButton.locator('svg');
  await expect(submitButtonIcon).toHaveAttribute('data-icon', 'envelope');
  await submitButton.click();
  await expect(submitButtonIcon).toHaveAttribute('data-icon', 'spinner');
  await expect(submitButtonIcon).toHaveAttribute('data-icon', 'envelope');
});
