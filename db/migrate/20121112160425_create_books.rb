class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :version
      t.integer :chapter
      t.integer :verse
      t.text :word

      t.timestamps
    end
  end
end
