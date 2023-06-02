// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { application } from "./controllers/application"

import NavbarController from "./controllers/navbar_controller.js"
application.register("navbar", NavbarController)


// document.querySelector("body > div.d-flex > div.w-50.col-lg-4 > div > div > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-right > div > div").remove();
