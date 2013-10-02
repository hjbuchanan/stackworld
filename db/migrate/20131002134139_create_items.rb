class CreateItems < ActiveRecord::Migration
def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.integer :room_id
      t.integer :x_coord
      t.integer :y_coord

      t.timestamps
    end
  end
end
