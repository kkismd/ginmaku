
words = null
window.font_large = ->
  words = $('td.words') if words is null
  font_size = parseInt(words.css("font-size"))
  new_font_size = parseInt(font_size * 1.1) + "px"
  words.css("font-size", new_font_size)
  new_font_size

window.font_small = ->
  words = $('td.words') if words is null
  font_size = parseInt(words.css("font-size"))
  new_font_size = parseInt(font_size * 0.9) + "px"
  words.css("font-size", new_font_size)
  new_font_size

window.scroll_up = -> 1
window.scroll_down = -> 1

$ ->
  $('#font_large').on('click', ->
    font_large_remote()
    false
  )
  $('#font_small').on('click', ->
    font_small_remote()
    false
  )
  $('#scroll_up').on('click',  scroll_up_remote);
  $('#scroll_donw').on('click',scroll_down_remote)
