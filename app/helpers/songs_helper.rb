# coding: utf-8
module SongsHelper
  # ふりがな処理のための正規表現
  RUBY_REG1 = /([一-龠々]+)\(([ぁ-ん]+)\)/   # 漢字 ⇒ ひらがな
  RUBY_REG2 = /([a-zA-Z']+)\(([ァ-ヶー]+)\)/ # 英語 ⇒ カタカナ
  RUBY_REG3 = /([ァ-ヴー]+)\(([ぁ-んー]+)\)/ # カタカナ ⇒ ひらがな

  def rubify(str)
    str.
        gsub(RUBY_REG1){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(RUBY_REG2){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        gsub(RUBY_REG3){"<ruby>#{$1}<rt>#{$2}</rt></ruby>"}.
        html_safe
  end

  def suppress_ruby(str)
    str.
        gsub(RUBY_REG1){$1}.
        gsub(RUBY_REG2){$1}.
        gsub(RUBY_REG3){$1}.
        html_safe
  end

  def title(page_title = 'PRAISE DATABASE')
    content_for :title, page_title.to_s
  end
end
