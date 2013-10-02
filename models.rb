class Room < ActiveRecord::Base
  has_many :connections, :foreign_key => "starting_room_id"
  has_many :ending_rooms, :through => :connections
  has_many :items

  belongs_to :creator, :class_name => "Player"
end

class Player < ActiveRecord::Base
  has_many :rooms, :foreign_key => "creator_id"
end

class Connection < ActiveRecord::Base
  # Since starting_room and ending_room aren't the actual
  # names of the class that these point to, we have to specify
  # them explicitly in the configuration of belongs_to
  belongs_to :starting_room, :class_name => "Room"
  belongs_to :ending_room, :class_name => "Room"
end

class Item < ActiveRecord::Base
  belongs_to :room
end

