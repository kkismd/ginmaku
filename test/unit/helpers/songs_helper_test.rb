# coding: utf-8
require 'test_helper'

class SongsHelperTest < ActionView::TestCase
  test '.rubify' do
    expected = '<ruby>主<rt>しゅ</rt></ruby>'
    actual = rubify('主(しゅ)')
    assert_equal(expected, actual)
  end

  test '.rubify class=roman' do
    expected = ' I seek You, Lord'
    actual = rubify(' I seek You, Lord')
    assert_equal(expected, actual)
  end

  test '.rubify class=roman 2' do
    expected = "<span class='roman'> ANATA MOTOMERU </span>"
    actual = rubify(' ANATA MOTOMERU ')
    assert_equal(expected, actual)
  end

  test '.rubify class=roman 3' do
    expected = 'C.Praise Him  Praise Him'
    actual = rubify('C.Praise Him  Praise Him')
    assert_equal(expected, actual)
  end

  test '.rubify class=roman 4' do
    expected = "<span class='roman'>　SHU IESU KARA  ME O HANASAZU NI </span>"
    actual = rubify('　SHU IESU KARA  ME O HANASAZU NI ')
    assert_equal(expected, actual)
  end
end
