# coding: utf-8
require 'test_helper'

class SongTest < ActiveSupport::TestCase
 # test "the truth" do
 #   assert true
 # end

  setup do
    @song = Song.create(words:'主(しゅ)')
  end

  test '.kana' do
    assert_equal 'しゅ', @song.kana
  end

  test '.kanji' do
    assert_equal '主', @song.kanji
  end

  test '.update_words_for_search' do
    @song.update_words_for_search
    assert_equal ['words_for_search'], @song.changed
    assert_equal '主しゅ', @song.words_for_search
  end

  test '.kananaize_with_space' do
    song = Song.new
    expected = "ともに よろこ び うた おう\n"
    actual = song.send(:kananaize_with_space, "ともに喜(よろこ)び歌(うた)おう\n")
    assert_equal expected, actual
  end

  test '.romanize! simple' do
    song = Song.new(words:"ともに喜(よろこ)び歌(うた)おう\n")
    song.romanize!
    expected = "ともに喜(よろこ)び歌(うた)おう\nTOMONI YOROKO BI UTA OH\n"
    actual = song.words
    assert_equal expected, actual
  end

  test '.romanize!' do
    before = <<ENDOF
イエスの勝利(しょうり)を　たたえよう
ともに喜(よろこ)び歌(うた)おう
イエスは血(ち)を流(なが)し　我(われ)らに
命(いのち)　与(あた)えられた
ENDOF
    after = <<ENDOF
イエスの勝利(しょうり)を　たたえよう
IESUNO SHORI O TATAEYO
ともに喜(よろこ)び歌(うた)おう
TOMONI YOROKO BI UTA OH
イエスは血(ち)を流(なが)し　我(われ)らに
IESUHA CHI O NAGA SHI WARE RANI
命(いのち)　与(あた)えられた
INOCHI ATA ERARETA
ENDOF
    song = Song.create(words:before)
    song.romanize!
    expected = after
    actual = song.words
    assert_equal expected, actual
  end
end
