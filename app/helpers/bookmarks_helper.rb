module BookmarksHelper
  def link_to_bookmark(bookmark)
    link_to bookmark.title, url_for(bookmark.raw_params)
  end
end
