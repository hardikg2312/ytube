class AddColsInChannelAndCategory < ActiveRecord::Migration
  def self.up
  	add_column :channels, :category_id, :integer
    add_column :categories, :channels_count, :integer, :default => 0

    Category.reset_column_information
    Category.all.each do |c|
      Category.update_counters c.id, :channels_count => c.channels.length
    end
  end

  def self.down
    remove_column :categories, :channels_count
    remove_column :channels, :category_id
  end
end
