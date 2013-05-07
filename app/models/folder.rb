class Folder < ActiveRecord::Base
  attr_accessible :title
  attr_accessor :title_date
  has_many :bookmarks_folders
  has_many :bookmarks, through: :bookmarks_folders, order: 'bookmarks_folders.position'

  def self.recents
    self.order('updated_at DESC').limit(10)
  end

  def add(bookmark)
    self.class.transaction do
      max_position = bookmarks_folders.maximum(:position) || 0
      bookmarks << bookmark
      a = bookmark.bookmarks_folders.where(folder_id: self.id).first
      a.position = max_position + 1
      a.save
    end
  end
end
