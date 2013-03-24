# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


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


current = 0

phrases = () -> $('.song')

# 子ウィンドウの歌詞を切り替える
@change_remote = (idx, url) ->
  detail_window = window.open('', 'projector')
  # 指定のURLにいなければ移動
  if url isnt detail_window.location.href
    detail_window.location = url
  detail_window.change(idx)

@change = (idx) ->
  phrases()[current].style.display = 'none'
  current = idx
  phrases()[current].style.display = 'block'
  resize(phrases()[current])

