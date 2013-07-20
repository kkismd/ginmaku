class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :title

      t.timestamps
    end
  end
end
