class AddStickyToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :sticky, :boolean, default: false
  end
end
