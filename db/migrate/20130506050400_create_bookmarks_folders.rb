class CreateBookmarksFolders < ActiveRecord::Migration
  def change
    create_table :bookmarks_folders do |t|
      t.integer :bookmark_id
      t.integer :folder_id
      t.integer :position
    end
  end
end
