class Makersbnb < Sinatra::Base

  get '/message' do
    erb :'messages/booking_message'
  end

  post '/message' do
    erb :'messages/confirmation'
  end

  get '/inbox' do
    erb :'messages/inbox'
  end

end
