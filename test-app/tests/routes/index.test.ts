import { test, expect } from 'tests/helpers/fixtures';

test('should render the root page', async ({ page }) => {
  await page.goto('http://localhost:4200');
  const title = await page.title();
  const headerTitle = await page.textContent('h1');
  expect(title).toBe('@spuxx/ember-core');
  expect(headerTitle).toBe('@spuxx/ember-core');
});
