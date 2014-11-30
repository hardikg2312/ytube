class RenameChannelCol < ActiveRecord::Migration
  def change
  	rename_column :channels, :subscription_count, :subscriptions
  end
end
