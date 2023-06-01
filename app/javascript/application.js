// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { application } from "./controllers/application"

import NavbarController from "./controllers/navbar_controller.js"
application.register("navbar", NavbarController)
