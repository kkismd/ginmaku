# coding: utf-8
class Song < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :code, :cright, :title, :words, :words_for_search, :deleted_at, :updated_at

  has_many :song_edits

  # ふりがな処理のための正規表現
  KANJI_KANA = /([一-龠々]+)\(([ぁ-ん]+)\)/ # 漢字 ⇒ ひらがな
  ENG_KANA = /([a-zA-Z']+)\(([ァ-ヶー]+)\)/ # 英語 ⇒ カタカナ
  KANA_HIRA = /([ァ-ヴー]+)\(([ぁ-んー]+)\)/ # カタカナ ⇒ ひらがな
  NOT_WORDS = /[^a-zA-Z一-龠々ぁ-んァ-ヶ々ー]/ # 英字、漢字、ひらがな、カタカナ 以外の文字

  def self.code_options
    %w(A Ab Bb C Cm D E  Eb Em F  F#m Fm G)
  end

  def self.recents
    self.order('updated_at DESC').limit(10)
  end

  # 空行で区切られたテキストをグループとする
  def phrases
    normalize_eol(words.to_s).split(/\n{2,}/)
  end

  # グループの一行目だけを返す
  def outline
    phrases.map{ |string| string.gsub(/\n.*/, '') }
  end

  def kanji
    kanjinize(words)
  end

  def kana
    kananize(words)
  end

  def update_words_for_search!
    self[:words_for_search] = ruby_trim(kanji + kana)
  end

  def ruby_trim(str)
    str.gsub(NOT_WORDS, '')
  end

  def romanize!
    return unless has_furigana?

    converter = RomanConverter.new
    result = StringIO.new
    normalize_eol(words).each_line do |line|
      if furigana?(line)
        result <<  line + converter.to_roman(kananaize_with_space(line))
      else
        result << line
      end
    end
    self.words = result.string
  end

  def has_furigana?
    furigana?(words)
    words =~ KANJI_KANA || words =~ ENG_KANA || words =~ KANA_HIRA
  end

  def build_edits
    song_edits.build words: words
  end

  def update_with(is_roman_button, new_attributes)
    is_saved = nil
    self.class.transaction do
      build_edits
      self.attributes = new_attributes
      romanize! if is_roman_button
      update_words_for_search!
      is_saved = save
    end
    is_saved
  end

  private
  def furigana?(str)
    str =~ KANJI_KANA || str =~ ENG_KANA || str =~ KANA_HIRA
  end

  def kanjinize(str)
    str.
        gsub(KANJI_KANA){$1}.
        gsub(ENG_KANA){$1}.
        gsub(KANA_HIRA){$1}
  end

  def kananize(str)
    str.
        gsub(KANJI_KANA){$2}.
        gsub(ENG_KANA){$1}.
        gsub(KANA_HIRA){$1}
  end

  def kananaize_with_space(str)
    str.
        gsub(KANJI_KANA){' ' + $2 + ' '}.
        gsub(ENG_KANA){' ' + $1 + ' '}.
        gsub(KANA_HIRA){' ' + $1 + ' '}
  end

  def normalize_eol(str)
    str.gsub(/\r\n/,"\n").gsub(/\r/, "\n")
  end
end