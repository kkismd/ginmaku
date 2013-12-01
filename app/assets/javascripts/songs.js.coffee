# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

phrases = -> $('.song')
current = 0

e = ->
  phrases()[current]
p = ->
  $(e())

preElement = ->
  $('.song pre')[current]

transition = (callback) ->
  $('#container').show()
  p().animate({opacity:0}, 100, ->
    p().css({display:'none'})
    preElement().style.position = "relative"
    callback()
    p().css({opacity:0, display:'block'})
    resize(e())
    preElement().style.position = "absolute"
    centering(e())
    p().animate({opacity:1}, 100)
  )


window.song_halve = ->
  if p().hasClass('half')
    $('.song').each( ->$(this).removeClass('half') )
    transition( -> p().removeClass('half') )
  else
    $('.song').each( ->$(this).addClass('half') )
    transition( -> p().addClass('half') )

# 指定された番号の歌詞に切り替える
window.change = (idx) ->
  transition( -> current = idx )

window.prev = ->
  return false if current <= 0
  transition( -> current-- )
  false

window.next = ->
  return false if current >= phrases().length - 1
  transition( -> current++ )
  false