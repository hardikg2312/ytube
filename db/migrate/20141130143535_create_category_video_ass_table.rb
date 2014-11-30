class CreateCategoryVideoAssTable < ActiveRecord::Migration
  def change
    
    create_table :categories_videos, id: false do |t|
      t.belongs_to :category
      t.belongs_to :video
    end
    add_index(:categories_videos, [:category_id, :video_id], :unique => true)
    add_index :categories_videos, :video_id
   end
end
