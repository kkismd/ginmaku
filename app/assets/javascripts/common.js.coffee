window.resize = (e) ->
  # フォントサイズを初期化する
  e.style.fontSize = '80px'

  # 領域のサイズとdivのサイズの割合を求める
  widthGap = e.parentNode.clientWidth / e.scrollWidth
  heightGap = e.parentNode.clientHeight / e.scrollHeight
  # 拡大率は縦横ではみ出しが大きい方に合わせる
  gapRatio = Math.min(widthGap, heightGap) * 0.95
  # サイズを変更する
  fontSize = e.style.fontSize
  newFontSize = parseInt(parseInt(fontSize) * gapRatio)
  e.style.fontSize = newFontSize + 'px'

window.centering = (element) ->
  inner = element.childNodes[0]
  wholeHeight = element.clientHeight
  innerHeight = inner.clientHeight
  topOffset = (wholeHeight - innerHeight) / 2
  inner.style.top = topOffset + "px"

wnd = null
target = 'projector'

get_target_window = ->
  if !wnd || !wnd.location
    wnd = window.open('', target)
  wnd

current = 0

# 子ウィンドウの歌詞を切り替える
window.change_remote = (idx, url) ->
  detail_window = get_target_window()

  # 指定のURLにいなければ移動
  if url isnt detail_window.location.href
    detail_window.location = url

  # 表示切り替えを指示
  setTimeout(->
    detail_window.change(idx)
    current = idx
  ,100)

window.prev_remote = (url) ->
  return false if current <= 0
  current--
  change_remote(current, url)
  $('#change-button-'+ current).effect( 'highlight', '', 200 )
  false

window.next_remote = (url) ->
  return false if current >= $('.change-button').length - 1
  current++
  change_remote(current, url)
  $('#change-button-'+ current).effect( 'highlight', '', 200 )
  false

window.wipe_remote = -> get_target_window().wipe()

window.wipe = ->
  $('#container').toggle()

window.song_halve_remote = -> get_target_window().song_halve()

window.font_large_remote  = -> get_target_window().font_large(); false
window.font_small_remote  = -> get_target_window().font_small(); false
window.scroll_up_remote   = -> get_target_window().scroll_up();  false
window.scroll_down_remote = -> get_target_window().scroll_down();false
