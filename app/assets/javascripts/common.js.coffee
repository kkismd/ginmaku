@resize = (e) ->
  # フォントサイズを初期化する
  e.style.fontSize = '72px'
  # 領域のサイズとdivのサイズの割合を求める
  widthGap = e.clientWidth / e.scrollWidth
  heightGap = e.clientHeight / e.scrollHeight
  # 拡大率は縦横ではみ出しが大きい方に合わせる
  gapRatio = Math.min(widthGap, heightGap)
  # サイズを変更する
  fontSize = e.style.fontSize
  newFontSize = parseInt(parseInt(fontSize) * gapRatio)
  e.style.fontSize = newFontSize + 'px'

wnd = null
target = 'projector'

get_detail_window = ->
  if !wnd || !wnd.location
    wnd = window.open('', target)
  wnd

current = 0

# 子ウィンドウの歌詞を切り替える
@change_remote = (idx, url) ->
  detail_window = get_detail_window()

  # 指定のURLにいなければ移動
  if url isnt detail_window.location.href
    detail_window.location = url

  # 表示切り替えを指示
  detail_window.change(idx)
  current = idx

@prev_remote = (url) ->
  return false if current <= 0
  current--
  change_remote(current, url)
  $('#change-button-'+ current).effect( 'highlight', '', 200 )
  false

@next_remote = (url) ->
  return false if current >= $('.change-button').length - 1
  current++
  change_remote(current, url)
  $('#change-button-'+ current).effect( 'highlight', '', 200 )
  false

