import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buttonchange"
export default class extends Controller {
  static targets = ["bookmark", "heart", "visited" ]
  connect() {
    console.log("Hello from Stimulus")
  }

  changeHeart(event) {
    event.preventDefault()
    console.log("click click click")
    console.log(event.currentTarget.innerHTML)
    this.heartTarget.classList.toggle("fa-regular")
    this.heartTarget.classList.toggle("fa-solid" )
  }

  changeBookmark(event) {
    event.preventDefault()
    console.log("bookmark")
    console.log(this.bookmarkTarget)
    this.bookmarkTarget.classList.toggle("fa-regular")
    this.bookmarkTarget.classList.toggle("fa-solid" )
  }

  changeVisited(event) {
    event.preventDefault()
    console.log("click click click")
    console.log(event.currentTarget.innerHTML)
    this.visitedTarget.classList.toggle("fa-regular")
    this.visitedTarget.classList.toggle("fa-solid" )
  }
}
