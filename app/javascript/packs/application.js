// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
import 'jquery';
import $ from 'jquery'
import Popper from 'popper.js'
import { changeStatus } from "../task"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = $
window.Popper = Popper
window.changeStatus = changeStatus