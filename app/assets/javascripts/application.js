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
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require froala_editor.min.js
//= require_self
//= require_tree .

var loadPage = function(body) {
  var controller = body.data("controller");
  var action = body.data("action");

  $(document).trigger(controller + "#" + action);
  return true;
}

var loadJavascript = function(body){
  loadPage(body);

  return true;
}

var initJavascript = function(){
  var body = $("body");
  if (!body.attr("data-init")) {
    body.attr("data-init", true);
    loadJavascript(body);
    return true;
  }

  return false;
};

$(document).ready(initJavascript);
$(document).on("turbolinks:load", initJavascript);