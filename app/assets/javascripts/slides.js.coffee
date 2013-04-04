# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

pages = -> $('.page')
current = 0

fadeOut = ->
  $(pages()[current]).fadeOut(200)

fadeIn = ->
  $(pages()[current]).fadeIn(200)

@change = (idx) ->
  fadeOut()
  current = idx
  fadeIn()
  resize(pages()[current])

@prev = ->
  return false if current <= 0
  fadeOut()
  current--
  fadeIn()
  false

@next = ->
  return false if current >= pages().length - 1
  fadeOut()
  current++
  fadeIn()
  resize(pages()[current])
  false
