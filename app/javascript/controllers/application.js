import { Application } from "@hotwired/stimulus"
import AutocompleteController from "./autocomplete_controller.js"

const application = Application.start()
application.register('autocomplete', AutocompleteController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
