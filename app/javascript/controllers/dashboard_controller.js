import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "enableButton", "disableButton" ]

  change(event) {
    if(event.target.checked){
      this.enableButtonTarget.click()
    }
    else {
      this.disableButtonTarget.click()
    }
  }
}

