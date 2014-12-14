class CreateSuggetions < ActiveRecord::Migration
  def change
    create_table :suggetions do |t|
      t.string :name
      t.string :suggetion_type
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
