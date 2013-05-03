class CreateSongEdits < ActiveRecord::Migration
  def change
    create_table :song_edits do |t|
      t.integer :song_id
      t.text :words

      t.timestamps
    end
  end
end
