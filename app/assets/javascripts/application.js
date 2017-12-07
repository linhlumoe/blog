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
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require fancybox
//= require owl.carousel
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require simple_form-bootstrap
//= require cocoon
//= require highcharts
//= require chartkick
//= require select2
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require_self

$(function() {
  $( ".select2" ).select2({
    theme: "bootstrap"
  });

  $("#owl-carousel").owlCarousel({
    loop: true,
    autoPlay: true,
    singleItem:true,
    autoplayTimeout: 5000,
    autoplayHoverPause: true
  });

  $("#owl-carousel .owl-item").css("height", $(window).height())

});
