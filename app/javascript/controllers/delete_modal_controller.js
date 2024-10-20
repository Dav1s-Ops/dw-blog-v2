import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-modal"
export default class extends Controller {
  static targets = ["modal"]

  open(event) {
    event.preventDefault()
    this.modalTarget.classList.remove("hidden")
    this.deleteButton = event.currentTarget
  }

  close() {
    this.modalTarget.classList.add("hidden")
  }

  confirm() {
    this.deleteButton.closest("form").submit()
  }
}
