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

var hotjar = (function(h,o,t,j,a,r){
	console.log("HotJar getting called!");
	        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
	        h._hjSettings={hjid:2112386,hjsv:6};
	        a=o.getElementsByTagName('head')[0];
	        r=o.createElement('script');r.async=1;
	        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
	        a.appendChild(r);
	    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');

$(document).on("turbolinks:load", ready);
$(document).on("turbolinks:load", hotjar);