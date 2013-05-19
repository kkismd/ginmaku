class Folder < ActiveRecord::Base
  attr_accessible :title
  attr_accessor :title_date
  has_many :bookmarks, order: 'bookmarks.position'

  def self.recents
    self.order('updated_at DESC').limit(10)
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
