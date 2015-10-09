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

var dashboardSections = [".awaiting-to-accept",".awaiting-to-rate", ".pending-to-accept", ".pending-to-rate",
".as-altruist", ".from-altruist"]

function iterateOverEachDashboardSection (arrayWithSections) {
  for (var i=0; i<arrayWithSections.length;i++){
    checkIfDashboardSeactionContainsTransaction($(arrayWithSections[i]))
  }
}

function checkIfDashboardSeactionContainsTransaction(div){
  if(div && div.find("p").length != 0){
    addGreenColorIfContainsTransactions(div);
  }
}

function addGreenColorIfContainsTransactions (div){
  var length = div.find("p").length;
  (div.find("h1")).addClass("has-content").append(" ("+ length+")");
}

$(document).ready(function(){
  iterateOverEachDashboardSection(dashboardSections);
});

$(document).on("click", ".log-in", function(event){
	event.preventDefault()
	$(".js-modal").modal();
});

$(document).on('click',("#how-it-works"), function(event) {
    $('html, body').animate({scrollTop: $("#first-step").offset().top}, 1000);
    return false;
});

$(document).on('click',("#back-to-top"), function(event) {
    $('html, body').animate({scrollTop: $("#how-it-works").offset().top}, 500);
    return false;
});

$(document).ready(function(event){
  $(".skills-icon").removeClass("skills-logo");
  $("#skills-logo").on({
    mouseenter: function () {
        $(".skills-icon").addClass("skills-logo");
    },
    mouseleave: function (event) {
        $(".skills-icon").removeClass("skills-logo");
    }
  })
})

// disable bootstrap default toggles
$(function() {
  setTimeout(function(){
    $('.alert').slideUp(1000);
  }, 2000);
});

$(document).on("input",".rating-input", function() {
    if (parseInt($('.rating-input').val()) <= 10 && parseInt($('.rating-input').val()) > 0){ 
      $('.rating-input').removeClass("invalid-rating");
      $('.rating-input').addClass("valid-rating");
      $("#accepted").attr('value', 'Accept');
    }
    else {
      $('.rating-input').removeClass("valid-rating");
      $('.rating-input').addClass("invalid-rating");
      $(".rating-input").attr('value', 'Invalid');
    }
});

$(document).on("click","#address-input-button", function() {
    if ($("#user_address").val().split(",").length != 2)
    {   
      alert("Incorrect format! \nShould be like: '1400 Spring Road, Seattle'");
      return false
    }
});

$(document).ready(function() {
  $(".drop-show-p").hide();
  $(".toggle").click(function(event) {
    event.preventDefault();
    $(this).siblings(".drop-show-p").slideToggle('slow');   
  });
});

$(document).on("click", "#send-invite-button", function(){
  if($("#input-subject").val() == "");
  {
    alert("You need to write a subject! \nE.g. 'Help painting the house'");
    return false
  }
})











