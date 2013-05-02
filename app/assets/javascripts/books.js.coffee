
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

current = 0
window.scroll_up = ->
  return false if current < 1
  current -= 1
  target_offset = $('.chapter:eq('+current+')').offset().top
  $('html,body').animate({scrollTop: target_offset}, 600, 'swing')

window.scroll_down = ->
  return false if current + 1 >= $('.chapter').length
  current += 1
  target_offset = $('.chapter:eq('+current+')').offset().top
  $('html,body').animate({scrollTop: target_offset}, 600, 'swing')

# key event binding
$ ->
  $('#font_large').on('click', -> font_large_remote() )
  $('#font_small').on('click', -> font_small_remote() )
  $('#scroll_up').on('click', -> scroll_up_remote() )
  $('#scroll_down').on('click', -> scroll_down_remote() )
