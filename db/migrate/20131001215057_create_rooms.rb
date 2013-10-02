class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :background_image
      t.integer :player_id

      t.timestamps
    end
  end
end
