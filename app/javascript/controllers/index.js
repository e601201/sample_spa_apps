// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

//jsbundling-railsをしようする場合は、下記のようなFormControllerを登録するコードが追加されているよ。
//import FormController from "./form_controller.js"
//application.register("form", FormController)

//今回はimportmap-railsを使うので、Stimulusコントローラーは自動で登録されます。index.jsにはコードは追加されないよ。

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
