# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
jQuery ->
  $('#timeslot_paid_gig').change ->
      $('#timeslot_pay_amount').toggle()

  $('#timeslot_paid_gig').each ->
    if this.checked
      $('#timeslot_pay_amount').show()
    else
      $('#timeslot_pay_amount').hide()

  $('#band-multi-select').select2({
      placeholder: "Select Bands"
    })
