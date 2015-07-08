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
// THe next panel color.  For now hard code the changes.  Add transitio to the
// nav and add classes for which panel it's above

$(function() {
  var $accentWords = $('.intro__accent-word');

  var accentWordIndex = 0;
  var interval = setInterval(function() {
    var $oldWord = $($accentWords[accentWordIndex]);
    var className = "intro__accent-word--hidden";
    accentWordIndex = (accentWordIndex + 1) % $accentWords.length;
    var $newWord = $($accentWords[accentWordIndex]);
    $newWord.toggleClass(className);
    $oldWord.toggleClass(className);
  }, 1500);

});