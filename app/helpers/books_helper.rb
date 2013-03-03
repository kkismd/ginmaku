# coding: utf-8
module BooksHelper
  def slash_to_br(str)
    h(str).gsub("／") { "<br>" }.html_safe
  end
end
