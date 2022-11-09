import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("HELLO STIMULUS")
    this.element.textContent = "Hello World!"
  }
}
