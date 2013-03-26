class Song < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :code, :cright, :kana, :title, :words, :deleted_at, :updated_at

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
end