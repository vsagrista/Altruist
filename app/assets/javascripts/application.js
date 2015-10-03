// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


$(document).on("click", ".log-in", function(event){
	event.preventDefault()
	$(".js-modal").modal();
});
$(document).on("click", ".sign-up", function(event){
	event.preventDefault()
	$(".js-modal").modal();
});
$(document).on('click',("#how-it-works"), function(event) {

    $('html, body').animate({scrollTop: $("#first-step").offset().top}, 1000);
    return false
});
$(document).on('click',("#back-to-top"), function(event) {

    $('html, body').animate({scrollTop: $("#how-it-works").offset().top}, 500);
    return false
});









