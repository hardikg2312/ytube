class AddColsInSubCategor < ActiveRecord::Migration
  def self.up
  	add_column :categories, :category_type, :string, :default => "main"
    add_column :categories, :parent_category, :integer
  end

  def self.down
    remove_column :categories, :category_type
    remove_column :categories, :parent_category
  end
end
