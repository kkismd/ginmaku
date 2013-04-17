class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :controller
      t.string :action
      t.text :params

      t.timestamps
    end
  end
end
