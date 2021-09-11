import { Controller } from "@hotwired/stimulus"
import md5 from 'md5'

export default class extends Controller {
  convert(event) {
    event.preventDefault()
    event.target.textContent = md5(event.target.textContent)
  }
}
