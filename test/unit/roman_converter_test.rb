# coding: utf-8
require 'test_helper'

class RomanConverterTest <  ActiveSupport::TestCase
  setup do
    @check_list =  [
        ['KYAIAKI', 'きゃあいあき'],
        ['EMMANUEL', 'インマヌエル'],
        ['KYO HASUBARASHII CHRISTMAS', 'きょう はすばらしい　クリスマス'],
        ['NEMU RU MIKO IESU ANATANOTAME', 'ねむ る みこ イエス　あなたのため'],
        ['SHU NO MIMAE NI IMA HITO TSUTONATTE', 'しゅ の みまえ に　いま　ひと つとなって'],
        ['HI NOYONI RAPPANO OTO DE', 'ひ のように　ラッパの おと で'],
        ['FAMILY KIMI HAFAMILY', 'ファミリー　きみ はファミリー'],
        ['IMA HASHIMOBEMOHSENO TOKI', 'いま はしもべモーセの とき'],
        ['SHU O HO MEMASU HAN-EI GA NAGA RE', 'しゅ を ほ めます　はんえい が なが れ'],
        ['KURU SHIMUTOKIHA HAGEMASHI ATA E', 'くる しむときは　はげまし あた え'],
        ['SHU O YOROKO BUKOTOHA', 'しゅ を よろこ ぶことは'],
        ['I love You Lord', 'I love You Lord'],
        ['JYUJIKA', 'じゅうじか'],
        ['YUUKI', 'ゆうき'],
        ['IESU', 'イエス'],
        ['OH', 'おう'],
        ['EIKO', 'えいこう'],
        ['SHORI', 'しょうり'],
        ['ERIYA', 'エリヤ'],
        ['SAH', 'サー'],
        ['KOH', 'コー'],
        ['HE', 'ヘー'],
        ['TAN-I', 'たんい'],
        ['TATCHI', 'たっち'],
        ['ISSHO', 'いっしょう'],
    ]
  end

  test '.convert' do
    converter = RomanConverter.new
    @check_list.each do |pair|
      expects, input = pair
      actual = converter.to_roman(input)
      assert_equal expects, actual
    end
  end

end

