class Makersbnb < Sinatra::Base

get '/booking/new' do
  @space_id = params[:space_id]
  erb :'bookings/new'
end

post '/booking/new' do
  "#{params[:space_id]}, #{params[:available_from]} #{params[:available_to]}"
end
end
