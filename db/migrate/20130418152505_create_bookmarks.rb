class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :action_name
      t.string :controller_name
      t.text :params_value

      t.timestamps
    end
  end
end
