class CreatePlayers < ActiveRecord::Migration
   def change
    create_table :players do |t|
      t.string :name
      t.text :description
      t.string :avatar_image

      t.timestamps
    end
  end
end
