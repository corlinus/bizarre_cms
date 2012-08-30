$ ->
  $('.jquery-selectlist').selectList
    sort: true

  $('.markitup').markItUp(mySettings)

  $('#meta legend').click ->
    $('#meta ol').slideToggle('fast')
