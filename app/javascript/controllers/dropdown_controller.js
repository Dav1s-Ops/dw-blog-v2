import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.toggleMenu = this.toggleMenu.bind(this)
    this.closeMenu = this.closeMenu.bind(this)
  }

  toggle(event) {
    event.stopPropagation()
    if (this.menuTarget.hasAttribute("hidden")) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.removeAttribute("hidden")
    requestAnimationFrame(() => {
      this.menuTarget.classList.remove("scale-95", "opacity-0")
      this.menuTarget.classList.add("scale-100", "opacity-100")
    })
    document.addEventListener("click", this.closeMenu)
  }

  closeMenu(event) {
    if (event && this.element.contains(event.target)) return

    this.menuTarget.classList.remove("scale-100", "opacity-100")
    this.menuTarget.classList.add("scale-95", "opacity-0")
    this.menuTarget.addEventListener('transitionend', () => {
      this.menuTarget.setAttribute("hidden", "")
    }, { once: true })
    document.removeEventListener("click", this.closeMenu)
  }
}
