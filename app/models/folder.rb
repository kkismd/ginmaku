class Folder < ActiveRecord::Base
  FOLDER_SHOW_COUNT = 20

  attr_accessible :title, :sticky
  attr_accessor :title_date
  has_many :bookmarks, order: 'bookmarks.position'

  def self.make(attr)
    title_date = attr[:title_date]
    title = title_date.to_s + ' ' + attr[:title]
    new(title: title)
  end

  def self.recents
    self.order('sticky DESC, updated_at DESC').limit(FOLDER_SHOW_COUNT)
  end

  def reorder(bookmark_ids)
    id_position_map = {}
    bookmark_ids.each_with_index do |bookmark_id, idx|
      id_position_map[bookmark_id.to_i] = idx
    end

    bookmarks.each do |bookmark|
      new_position = id_position_map[bookmark.id]
      if bookmark.position != new_position
        bookmark.position = new_position
        bookmark.save
      end
    end
  end

  def add(bookmark)
    self.class.transaction do
      max_position = bookmarks.maximum(:position) || 0
      bookmarks << bookmark
      bookmark.position = max_position + 1
      bookmark.save
    end
  end
end
