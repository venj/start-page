class AddWeightToCatagories < ActiveRecord::Migration
  def self.up
    add_column :catagories, :weight, :integer, :default => 1
  end

  def self.down
    remove_column :catagories, :weight
  end
end
