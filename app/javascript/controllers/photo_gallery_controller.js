import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-gallery"
export default class extends Controller {
 static targets = ["big"]

 changeImg(event) {
  this.bigTarget.src = event.target.src
 }
}
