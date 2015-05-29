# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#paid-gig').change ->
    $('#gig-pay-amount').toggle()

  $('#paid-gig').each ->
    if this.checked
      $('#gig-pay-amount').show()
    else
      $('#gig-pay-amount').hide()

  $('#band-multi-select').select2({
    placeholder: "Select Bands"
  })

  $ ->
    $('.gig').hover (event) ->
      $(this).toggleClass("hover")
