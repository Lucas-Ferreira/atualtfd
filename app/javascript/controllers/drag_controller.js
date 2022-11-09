import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drag"
export default class extends Controller {
  greet() {
    console.log("HELLO");
  }
}
