# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

phrases = () -> $('.song')
current = 0

fadeOut = ->
  $(phrases()[current]).fadeOut(200)

fadeIn = ->
  $(phrases()[current]).fadeIn(200)

# 指定された番号の歌詞に切り替える
@change = (idx) ->
  fadeOut()
  current = idx
  fadeIn()
  resize(phrases()[current])

@prev = ->
  return false if current <= 0
  fadeOut()
  current--
  fadeIn()
  resize(phrases()[current])
  false

@next = ->
  return false if current >= phrases().length - 1
  fadeOut()
  current++
  fadeIn()
  resize(phrases()[current])
  false