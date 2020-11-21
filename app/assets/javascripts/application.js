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
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require particles.min
//= require Chart.bundle
//= require three
//= require turbolinks
//= require_tree .

var ready = function() {
	// console.log("It works on each visit!");
	$('[data-toggle="tooltip"]').tooltip();
  gtag('config', 'G-3FGMDJN3H6')

};

$(document).on("turbolinks:load", ready);

