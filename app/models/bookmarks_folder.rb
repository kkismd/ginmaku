class BookmarksFolder < ActiveRecord::Base
  attr_accessible :bookmark_id, :folder_id, :position
  belongs_to :bookmark
  belongs_to :folder
end
