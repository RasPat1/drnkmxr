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

jQuery.fn.scrollTo = function(time) {
    $('html,body').animate({
      scrollTop: $(this).offset().top
    }, time);
  };

$(function() {

/******************************************************************************
 Home Pages
 ******************************************************************************/

  var $accentWords = $('.intro__accent-word');
  var accentWordIndex = 0;
  var $firstBookBtn = $('.intro__book-btn');
  var $bookPanel = $('.marketing__cta');
  var $signUpInput = $('.sign-up__zip-input');

  // Attach an event handler to the "Book" button and scroll to sign up
  // form on click
  $firstBookBtn.click(function() {
    $bookPanel.scrollTo(500);
    $signUpInput.focus();
  });

  // Cycle the accent words on an interval
  setInterval(function() {
    var $oldWord = $($accentWords[accentWordIndex]);
    accentWordIndex = (accentWordIndex + 1) % $accentWords.length;
    var $newWord = $($accentWords[accentWordIndex]);
    $oldWord.fadeToggle(1000).delay(500).css({display: "none"});
    $newWord.fadeToggle(500).delay(500).css({display: "inline"});
  }, 2000);

  var $bookForm = $('#new_booking');
  var $failDiv = $('.cta__form-fail');

  $bookForm.on('ajax:success', function(e, data, status, xhr) {
    var message = data.message;
    if (data.success) {
      $bookForm.text(message);
      $failDiv.addClass('hidden');
    } else {
      $failDiv.removeClass('hidden');
      $failDiv.text(message);
    }
  }).on('ajax:error',function(e, xhr, status, error) {
    $failDiv.removeClass('hidden');
    $failDiv.text('Failed.');
  });

/******************************************************************************
 Checkout Pages
 ******************************************************************************/

 var selectedCount;
 var $drnks = $('.drnk');

 $drnks.each(function() {
  var $this = $(this);
  $this.click(function(e) {
    selectedCount = getSelectedCount();
    if (selectedCount < 3 || $this.hasClass('selected')) {
      $this.toggleClass('selected');
    }
  });
 });

 function getSelectedCount() {
  return $('.drnk.selected').size();
 }

});
