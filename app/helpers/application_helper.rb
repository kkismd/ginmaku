# coding: utf-8
module ApplicationHelper
  def button_to_blank
    button_to_function '空白⇔表示', 'wipe_remote()'
  end
end
