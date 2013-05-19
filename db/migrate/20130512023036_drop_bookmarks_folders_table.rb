class DropBookmarksFoldersTable < ActiveRecord::Migration
  def up
    drop_table :bookmarks_folders
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
