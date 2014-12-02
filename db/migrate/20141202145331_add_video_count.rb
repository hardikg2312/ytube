class AddVideoCount < ActiveRecord::Migration
  def self.up
    add_column :channels, :videos_count, :integer, :default => 0

    Channel.reset_column_information
    Channel.all.each do |c|
      Channel.update_counters c.id, :videos_count => c.videos.length
    end
  end

  def self.down
    remove_column :channels, :videos_count
  end
end
