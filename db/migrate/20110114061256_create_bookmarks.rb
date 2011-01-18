class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.references :user
      t.references :catagory

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
