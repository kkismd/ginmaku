module BookmarksHelper
  def link_to_bookmark(bookmark)
    link_to truncate(bookmark.title, length: 20), url_for(bookmark.raw_params)
  end
end
