class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :version
      t.integer :book_name_id
      t.integer :chapter
      t.integer :verse
      t.text :word
    end
  end
end
