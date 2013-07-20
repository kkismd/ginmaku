# coding: utf-8
module BookmarksHelper
  def link_to_bookmark(bookmark)
    link_to truncate_ja(bookmark.title, 29), url_for(bookmark.raw_params)
  end

  # 非ASCII文字を文字幅2として計算する truncate
  def truncate_ja(str, limit)
    omission = '…'
    chars = str.split //

    result = ''
    result_len = 0
    chars.each do |char|
      if char.match /\p{ASCII}/
        result_len += 1
      else
        result_len += 2
      end

      if result_len <= limit
        result << char
      else
        result << omission
        break
      end
    end
    result
  end
end
