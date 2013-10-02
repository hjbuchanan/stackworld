class CreateConnections < ActiveRecord::Migration
    def change
    create_table :connections do |t|
      t.integer :starting_room_id
      t.integer :ending_room_id
      t.string :connection_name

      t.timestamps
    end
  end
end
