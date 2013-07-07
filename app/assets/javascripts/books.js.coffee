window.books_centering = ->
  $container = $('#bible-words-container')
  $header = $('#book-name')
  $element = $('#wd-' + current)
  topOffset = ($container.height() - $element.height()) / 2 - $header.height()
  if topOffset > 0
    $element.css('position', 'absolute')
    $element.css('top', topOffset)

window.books_resize = ->
  $container = $('#bible-words-container')
  $element = $('#wd-' + current)
  container_height = $container.height()
  element_height = $element.height()
  if container_height < element_height
    gap_ratio = container_height / element_height
    font_size = parseInt($container.css('font-size'))
    new_font_size = font_size * gap_ratio * 0.95
    $container.css('font-size', new_font_size + 'px')

current = 0
w = -> $('#wd-' + current)

books_transition = (callback) ->
  w().animate({opacity:0}, 100, ->
    w().css({display:'none'})
    callback()
    w().css({opacity:0, display:'block'})
    books_resize()
    books_centering()
    w().animate({opacity:1}, 100)
  )
  false

max_section_num = 0

window.set_max_section_num = (num) ->
  max_section_num = num

window.scroll_up = ->
  return false if current < 1
  books_transition(-> current--)
  false

window.scroll_down = ->
  return false if current + 1 >= max_section_num
  books_transition(-> current++)
  false

font_size_change = (callback) ->
  $container = $('#bible-words-container')
  font_size = parseInt($container.css('font-size'))
  new_font_size = callback(font_size) + 'px'
  $container.css('font-size', new_font_size)
  books_centering()

window.font_large = ->
  font_size_change( (size) -> size * 1.1 )

window.font_small = ->
  font_size_change( (size) -> size * 0.9 )
