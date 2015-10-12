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
 Checkout -- Menu selection
 ******************************************************************************/

 var selectedCount;
 var $drinks = $('.drink__clickable');
 var $nextBtn = $('.checkout__book-btn');

 $drinks.each(function() {
  var $this = $(this);
  $this.click(function(e) {
    selectedCount = getSelectedCount();
    if (selectedCount < 3 || $this.hasClass('selected')) {
      $this.toggleClass('selected');
    }
  });
 });

 $nextBtn.click(function(e) {
  var drinkIds = [];
  var $idInput = $('.checkout__drink-ids');

  var $selectedDrinks = $('.drink.selected');
  $selectedDrinks.each(function() {
    drinkIds.push($(this).data('id'));
  });
  $idInput.val(drinkIds);

  // e.preventDefault();
  // return false;
 });

 function getSelectedCount() {
  return $('.drink.selected').size();
 }

/******************************************************************************
 Checkout -- Event Info
 ******************************************************************************/

  var $inputs = $('.event-edit__details-input');
  $inputs.change(function(e) {
    var $this = $(this);
    var data = extractEventData($this);
    updatePricing(data);
  });

  // Get data out of form fields into javascript object
  function extractEventData() {
    var data = {};
    data['guestCount'] = $('#event-details__guest-count').val();
    data['time'] = $('#event-details__event-time').val();
    data['length'] = $('#event-details__event-length').val();
    data['date'] = $('#event-details__event-date').val();

    return data;
  }

  // Update the pricing section based on the data
  function updatePricing(data) {
    var $priceDisplay = $('#event-edit__price');
    var totalPrice = 0;
    var priceMultiplier = 1.1;
    var emptyPriceText = '___';
    if (isValidData(data)) {
      totalPrice = data['guestCount'] * data['length'] * priceMultiplier;
    }

    if (totalPrice > 0) {
      var totalPriceText = formatMoney(totalPrice);
      $priceDisplay.text(totalPriceText);
    } else {
      $priceDisplay.text(emptyPriceText);
    }
  }

  function isValidData(data) {
    var fields = ['guestCount', 'time', 'length', 'date'];
    var isValid = true;
    for( var i = 0; i < fields.length; i++) {
      var fieldName = fields[i];
      if (data[fieldName]) {
        isValid = isValid && true;
      } else {
        isValid = isValid && false;
      }
    }
    return isValid;
  }

  function formatMoney(money) {
    var decimalIndex = money.indexOf('.'); // Length of string before decimals
    var moneyString = money + ''; // Coerce to String

    if (decimalIndex !== -1) {
      if (money.length == decimalIndex + 2) {
        moneyString = moneyString.substr(0, decimalIndex + 2) + '0';
      } else if (money.length > decimalIndex + 3) {
        moneyString = moneyString.substr(0, decimalIndex + 3);
      }
    }
    if (decimalIndex >= 4) { // 3 digits and a period. TO get 1st comma must have at least 4 characters
      var commaIndex = decimalIndex % 3
      moneyString = moneyString.slice(0, commaIndex) + ',' + moneyString.slice(commaIndex);
    }

    return moneyString;
  }

});
