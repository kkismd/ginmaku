# coding: utf-8
require 'test_helper'

class SongsHelperTest < ActionView::TestCase
  test '.rubify' do
    expected = '<ruby>主<rt>しゅ</rt></ruby>'
    actual = rubify('主(しゅ)')
    assert_equal(expected, actual)
  end

end
