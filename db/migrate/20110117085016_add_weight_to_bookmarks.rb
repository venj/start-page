class AddWeightToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :weight, :integer, :default => 1
  end

  def self.down
    remove_column :bookmarks, :weight
  end
end
