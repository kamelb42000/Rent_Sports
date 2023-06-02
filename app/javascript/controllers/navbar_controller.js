import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"];

  connect() {
    console.log("toto");
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("showmenu");
    this.element.classList.toggle("disable_scroll");
  }
}
