class ChangeLimitInChannel < ActiveRecord::Migration
  def up
    change_column :channels, :subscriptions, :integer, :limit => 8
    change_column :channels, :total_views, :integer, :limit => 8
  end

  def down
    change_column :channels, :subscriptions, :integer
    change_column :channels, :total_views, :integer
  end
end
