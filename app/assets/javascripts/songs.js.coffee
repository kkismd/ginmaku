# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

resize = (idString) ->
  o = $("#" + idString)
  e = o.get(0) # jQueryObjectからHtmlElementを取り出す

  # 領域のサイズとdivのサイズの割合を求める
  widthGap = e.clientWidth / e.scrollWidth
  heightGap = e.clientHeight / e.scrollHeight

  # 拡大率は縦横ではみ出しが大きい方に合わせる
  gapRatio = Math.min(widthGap, heightGap)

  # サイズを変更する
  fontSize = parseInt o.css("fontSize")
  newFontSize = parseInt(fontsize * gapRatio)
  o.css("fontSize", newFontSize)
