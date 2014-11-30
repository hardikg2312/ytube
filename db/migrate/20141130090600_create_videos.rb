class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_id
      t.string :video_url
      t.string :title
      t.integer :channel_id
      t.string :thumbnail_medium
      t.string :thumbnail_high
      t.string :thumbnail_standard
      t.text :description 
      t.datetime :published_at
      t.integer :view_count
      t.integer :like_count
      t.integer :dislike_count
      t.integer :comment_count


      t.timestamps
    end
  end
end
