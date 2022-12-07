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
    event.currentTarget.classList.toggle("fa-regular")
    event.currentTarget.classList.toggle("fa-solid" )
  }

  changeVisited(event) {
    event.preventDefault()
    console.log("click click click")
    console.log(event.currentTarget.innerHTML)
    event.currentTarget.innerHTML = '<i class="fa-regular fa-circle-check show-btn fa-3x my-2 "></i>'
  }
}
