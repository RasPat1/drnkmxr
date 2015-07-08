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
//= require turbolinks
//= require_tree .

// get height of second panel
// switch the colors and add the border once height is on the second panel
// Is there a way to check if two elements are ontop of each other?

// Js for spinning text
// Use a css transition transform z?  rotate z?

// Once the nave bar goes past the first panel fade the color to
// THe next panel color.  FOr now hard code the changes.  Add transitio to the
// nav and add classes for which panel it's above

$(function() {
  var $nav = $('nav');
  var navOffsetTop;
  var panelHeight = 600;
  var navColorRules = [ // Nav color rules are in sorted order by height
    {
      height: 0,
      color: "green"
    },
    {
      height: 600,
      color: "red"
    }
  ];

  $(window).scroll(function() {
    navOffsetTop = $nav.offset().top;
    var newColorClass = getNextColorClass(navOffsetTop);
    $('.nav').removeClass('*--color');
    $('.nav').addClass(newColorClass);
  }.bind(this));

  function getNextColorClass(offsetTop) {
    var newColorClassHeight = 0;
    var newColorClass = ""
    for (var i = 0; i < navColorRules.length; i++) {
      var rule = navColorRules[i];
      if (offsetTop > rule.height && newColorClassHeight >= rule.height) {
        newColorClassHeight = rule.height;
        newColorClass = rule.color;
      }
    }
    return newColorClass ? "nav--color-" + newColorClass : "nav--color-default";
  }
});