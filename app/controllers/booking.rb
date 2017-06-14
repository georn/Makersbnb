class Makersbnb < Sinatra::Base

get '/booking/new' do
  @space_id = params[:space_id]

  erb :'bookings/new'
end

post '/booking/new' do
  space = Space.get(params[:space_id])
  p "yo #{space.available_from}"
  p "work for meeee #{space.available_to}"
  # Booking.create(date: params[:date])
  # redirect '/spaces'
end
end
