# coding: utf-8
class Song < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :code, :cright, :title, :words, :words_for_search, :deleted_at, :updated_at

  # ふりがな処理のための正規表現
  RUBY_REG1 = /([一-龠々]+)\(([ぁ-ん]+)\)/   # 漢字 ⇒ ひらがな
  RUBY_REG2 = /([a-zA-Z']+)\(([ァ-ヶー]+)\)/ # 英語 ⇒ カタカナ
  RUBY_REG3 = /([ァ-ヴー]+)\(([ぁ-んー]+)\)/ # カタカナ ⇒ ひらがな
  RUBY_REG4 = /[^a-zA-Z一-龠々ぁ-んァ-ヶ々ー]/ # 英字、漢字、ひらがな、カタカナ 以外の文字

  def self.code_options
    %w(A Ab Bb C Cm D E  Eb Em F  F#m Fm G)
  end

  def self.recents
    self.order('updated_at DESC').limit(10)
  end

  # 空行で区切られたテキストをグループとする
  def phrases
    words.gsub(/\r\n/){"\n"}.gsub(/\r/){"\n"}.split(/\n{2,}/)
  end

  # グループの一行目だけを返す
  def outline
    phrases.map{ |string| string.gsub(/\n.*/, '') }
  end

  def kanji
    words.
        gsub(RUBY_REG1){$1}.
        gsub(RUBY_REG2){$2}.
        gsub(RUBY_REG2){$3}
  end

  def kana
    words.
        gsub(RUBY_REG1){$2}.
        gsub(RUBY_REG2){$2}.
        gsub(RUBY_REG3){$3}
  end

  def update_words_for_search
    self[:words_for_search] = ruby_trim(kanji + kana)
  end

  def ruby_trim(str)
    str.gsub(RUBY_REG4, '')
  end

  def romanize!
    converter = RomanConverter.new
    result = StringIO.new
    if words =~ RUBY_REG1 || words =~ RUBY_REG2 || words =~ RUBY_REG3
      self.words.each_line do |line|
        result <<  line + "\n" + converter.convert(line)
      end
      self.words = result.string
    end
  end
end