ready = ->
  quiz = $('section#quiz')
  quiz.on 'click', 'button#showAnswer', (event) ->
    quiz.addClass('flip')
  $("#nextQuestion").on "ajax:success", (evt, data, status, xhr) ->
    _gauges.push(['track']);
    quiz.addClass('slideOut')
    quiz.on "animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd", (event) ->
      quiz.removeClass('flip').removeClass('slideOut')
      quiz.find('.answer').html(data.question.answer_html)
      quiz.find('.question').html(data.question.content_html)

$(document).ready(ready)
$(document).on('page:load', ready)