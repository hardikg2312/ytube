class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      
      t.string :ytube_id
      t.integer :channel_category_id
      t.text :title
      t.text :content
      t.text :thumbnail
      t.integer :subscription_count
      t.integer :total_views


      t.timestamps
    end
  end
end
