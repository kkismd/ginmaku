class AddColumnToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :folder_id, :integer
    add_column :bookmarks, :position, :integer
  end
end
