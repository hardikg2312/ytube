class AddChannelUrlToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :channel_url, :text
  end
end
