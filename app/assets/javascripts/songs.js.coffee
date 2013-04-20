# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

phrases = -> $('.song')
current = 0

e = ->
  phrases()[current]
p = ->
  $(e())

transition = (callback) ->
  p().animate({opacity:0}, 100, ->
    p().css({display:'none'})
    callback()
    p().css({opacity:0, display:'block'})
    resize(e())
    p().animate({opacity:1}, 100)
  )

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