
require 'bundler'
Bundler.setup

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require_relative 'environments'
require_relative 'models.rb'

get '/room/:room_id' do
  @room_id = params[:room_id].to_i
  @room = Room.find(@room_id)
  @title = @room.name
  erb :room
end

post '/create_room' do
  room_name = params[:name]
  room_description = params[:description]
  background_image = params[:background_image]
  #"You saved a room called #{room_name} with this description: #{room_description}"
  Room.create(:name => room_name, :description => room_description, :background_image => background_image)
end

get '/room_with_a_view' do
  erb :room_with_a_view
end

get '/create_room' do
  @title = "Create a Room"
  erb :create_room_form
end

post '/create_room' do
  room_name = params[:name]
  room_description = params[:description]
  "You saved a room called #{room_name} with this description: #{room_description}"
end

get '/room/:room_id/connections/new' do
  @title = "Create a Connection"
  # Find the room the user was standing in
  @room = Room.find(params[:room_id])

  # Find all rooms so we can show them in a select form
  @all_rooms = Room.all
  erb :create_connection
end

post '/room/:room_id/connections/new' do
  @starting_room = Room.find(params[:room_id])
  @ending_room = Room.find(params[:connecting_room_id])
  @name = params[:name]

  c = Connection.create(:connection_name => @name,
    :starting_room => @starting_room,
    :ending_room => @ending_room)

  redirect "/room/#{@starting_room.id}"
end

get '/room/:room_id/items/new' do
  @title = "Leave an Item"
  # Find the room the user was standing in
  @room = Room.find(params[:room_id])

  erb :create_item
end

post '/room/:room_id/items/new' do
  @starting_room = Room.find(params[:room_id])
  @name = params[:name]
  @description = params[:description]
  @image_url = params[:image_url]
  @x_coord = params[:x_coord]
  @y_coord = params[:y_coord]

  # Notice how we're using the methods added by has_many
  # to connect the Item to the room here
  c = @starting_room.items.create(:name => @name,
    :description => @description,
    :image_url => @image_url,
    :x_coord => @x_coord,
    :y_coord => @y_coord)

  redirect "/room/#{@starting_room.id}"
end

get '/room/:room_id/edit' do
  @room = Room.find(params[:room_id])
  @title = "Edit Room - #{@room.name}"

  erb :edit_room
end

put '/room/:room_id/edit' do
  room_name = params[:name]
  room_description = params[:description]
  background_image = params[:background_image]
  room = Room.find(params[:room_id])

  room.update_attributes(:name => room_name, :description => room_description, :background_image => background_image)

  redirect "/room/#{room.id}"
end


# not_found do
#   erb :error
# end
