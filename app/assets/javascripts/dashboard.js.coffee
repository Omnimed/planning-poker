filterStories = ->
  $('#sub-menu li').on 'click', ->
    $(this).addClass('selected').siblings().removeClass('selected')
    filterState(this)

filterState = (selector) ->
  $('.story').hide()
  $('.teamDropDown').hide()
  switch $(selector).prop('id')
    when 'filter-unestimated'
      $('.story-unestimated').show()
    when 'filter-tusken'
      $(".story[class*='tusken']").show()
      $(".teamDropDown[class*='tusken']").show()
      if ($(".teamDropDown[class*='tusken'] #dropfilter-unestimated").hasClass('selected'))
         $(".story").not('.story-unestimated').hide()
    when 'filter-spc'
      $(".story[class*='spc']").show()
      $(".teamDropDown[class*='spc']").show()
      if ($(".teamDropDown[class*='spc'] #dropfilter-unestimated").hasClass('selected'))
         $(".story").not('.story-unestimated').hide()
    when 'filter-riddlers'
      $(".story[class*='riddlers']").show()
      $(".teamDropDown[class*='riddlers']").show()
      if ($(".teamDropDown[class*='riddlers'] #dropfilter-unestimated").hasClass('selected'))
         $(".story").not('.story-unestimated').hide()
    else $('.story').show()

selectCard = ->
  $('.card-revealed').on 'click', ->
    vote = $(this).parent().data('vote').split('-')

    $.ajax
      type:     'POST'
      url:      '/select-vote'
      data:     { story_id: vote[0], username: vote[1] }
      dataType: 'script'

window.filterState = filterState
window.selectCard  = selectCard

$(document).ready(filterStories)
$(document).ready(selectCard)
