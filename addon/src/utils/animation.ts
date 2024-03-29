/**
 * Creates a ripple animation on the event target.
 * @param event The event object.
 */
export async function createClickRipple(event: Event) {
  // Clean up existing ripples
  const existingRipples = document.body.getElementsByClassName(
    'spec__click-ripple-container',
  );
  for (const ripple of existingRipples) {
    ripple.remove();
  }
  // Create new ripple
  const control = event.currentTarget as HTMLElement;
  if (control) {
    const rippleContainer = document.createElement('span');
    rippleContainer.classList.add('spec__click-ripple-container');
    const ripple = document.createElement('span');
    const diameter = Math.max(control.clientWidth, control.clientHeight);
    ripple.style.width = ripple.style.height = `${diameter}px`;
    ripple.classList.add('spec__click-ripple');
    rippleContainer.appendChild(ripple);
    control.appendChild(rippleContainer);
  }
}
