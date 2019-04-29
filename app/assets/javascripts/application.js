// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .
// Data Picker Initialization
// document.getElementById("disabled"){
//   var isDisabled = document.getElementById("enabled").value;
// }).disabled = isDisabled;

// @disableFunction =() ->
//   return document.getElementById("disabled").value
// jQuery.rails.disableFormElements = (form) ->
//   submittedBy = form.data('ujs:submit-button')
//
//   form.find(jQuery.rails.disableSelector).each ->
//     element = $(this)
//     if submittedBy && element.attr('name') == submittedBy.name && element.attr('value') == submittedBy.value
//       # default jquery-rails behaviour
//       jQuery.rails.disableFormElement(element);
//     else
//       # vanilla disable
//       element.prop('disabled', true)
