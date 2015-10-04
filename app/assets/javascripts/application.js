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
//= require jquery.turbolinks


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

$(function() {
  setTimeout(function(){
    $('.alert').slideUp(1000);
  }, 2000);
});

$(document).on("input",".rating-input", function() {
    if (parseInt($('.rating-input').val()) <= 10 && parseInt($('.rating-input').val()) > 0){   
      $('.rating-input').css("background", "green");
      $("#accepted").attr('value', 'Accept')
    }
    else {
      $('.rating-input').css("background", "red");
      $(".rating-input").attr('value', 'Invalid')
    }
});

$(document).ready(function() {
  $(".drop-show-p").hide();
  $(".toggle").click(function(event) {
event.preventDefault();
    $(this).siblings(".drop-show-p").slideToggle('slow')
      
  });
});


$(document).ready(function(){
  if($(".awaiting-to-accept").find("p").length != 0){
    var length = $(".awaiting-to-accept").find("p").length 
  $(".awaiting-to-accept > h1").addClass("has-content").append("<strong>"+" ("+ length+")" +"</strong>")
  }
  if ($(".awaiting-to-rate").find("p").length != 0){
    var length = $(".awaiting-to-rate").find("p").length  
  $(".awaiting-to-rate > h1").addClass("has-content").append("<strong>"+" ("+ length+")" +"</strong>")
  }
  if ($(".pending-to-accept").find("p").length != 0){
    var length = $(".pending-to-accept").find("p").length   
  $(".pending-to-accept > h1").addClass("has-content").append("<strong>"+" ("+ length+")" +"</strong>")
  }
  if ($(".pending-to-rate").find("p").length != 0){
    var length = $(".pending-to-rate").find("p").length 
  $(".pending-to-rate > h1").addClass("has-content").append("<strong>"+" ("+ length+")" +"</strong>")
  }
});







