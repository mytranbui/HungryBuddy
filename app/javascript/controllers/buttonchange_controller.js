import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buttonchange"
export default class extends Controller {
  connect() {
    console.log("Hello from Stimulus")
  }

  changeheart(event) {
    event.preventDefault()
    console.log("click click click")
    console.log(event.currentTarget.innerHTML)
    event.currentTarget.innerHTML = '<i class="fa-solid fa-heart show-btn fa-3x my-2 "></i>'
  }
}
