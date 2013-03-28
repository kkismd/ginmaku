# coding: utf-8
module SongsHelper

  def rubify(str)
    str.
        gsub(Song::KANJI_KANA){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(Song::ENG_KANA){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(Song::KANA_HIRA){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        html_safe
  end

  # TODO Song#kanji で実装する
  def suppress_ruby(str)
    str.
        gsub(Song::KANJI_KANA){$1}.
        gsub(Song::ENG_KANA){$1}.
        gsub(Song::KANA_HIRA){$1}.
        html_safe
  end

  def title(page_title = 'PRAISE DATABASE')
    content_for :title, page_title.to_s
  end
end
