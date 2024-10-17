import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    const fadeOutDelay = 3000;

    const fadeOutDuration = 500;

    setTimeout(() => {
      this.element.classList.add('transition', 'duration-500', 'ease-in-out', 'transform', '-translate-y-full', 'opacity-0');

      setTimeout(() => {
        this.element.remove();
      }, fadeOutDuration);
    }, fadeOutDelay);
  }
}