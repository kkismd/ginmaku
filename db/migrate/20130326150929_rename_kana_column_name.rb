class RenameKanaColumnName < ActiveRecord::Migration
  def up
    rename_column :songs, :kana, :words_for_search
  end

  def down
    rename_column :songs, :words_for_search, :kana
  end
end
