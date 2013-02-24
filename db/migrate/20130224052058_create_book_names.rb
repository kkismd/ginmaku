class CreateBookNames < ActiveRecord::Migration
  def change
    create_table :book_names do |t|
      t.integer :testament
      t.string :japanese
      t.string :english
    end
  end
end
