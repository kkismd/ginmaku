class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :code
      t.string :title
      t.text :words
      t.text :kana
      t.string :cright
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
