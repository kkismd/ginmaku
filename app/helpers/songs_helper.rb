# coding: utf-8
module SongsHelper

  def rubify(str)
    str.
        gsub(Song::RUBY_REG1){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(Song::RUBY_REG2){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(Song::RUBY_REG3){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        html_safe
  end

  # TODO Song#kanji で実装する
  def suppress_ruby(str)
    str.
        gsub(Song::RUBY_REG1){$1}.
        gsub(Song::RUBY_REG2){$1}.
        gsub(Song::RUBY_REG3){$1}.
        html_safe
  end

  def title(page_title = 'PRAISE DATABASE')
    content_for :title, page_title.to_s
  end
end
