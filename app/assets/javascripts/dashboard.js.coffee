jQuery ->
  $('.giglets').click ->
    $(this).siblings('.giglet-body').slideToggle()
