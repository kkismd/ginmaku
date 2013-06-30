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
  containerHeight = $container.height()
  elementHeight = $element.height()
  if containerHeight < elementHeight
    gap_ratio = containerHeight / elementHeight
    font_size = parseInt($container.css('font-size'))
    new_font_size = font_size * gap_ratio * 0.95
    console.log('containerHeight :' + containerHeight)
    console.log('elementHeight :' + elementHeight)
    console.log('gap_ratio: ' + gap_ratio)
    console.log('fontSize: ' + new_font_size)
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
