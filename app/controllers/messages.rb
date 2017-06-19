class Makersbnb < Sinatra::Base
  get '/message' do
    erb :'messages/booking_message'
  end

  post '/message' do
    Message.create(text: params[:message],
                   sender_id: current_user.id,
                   receiver_id: Space.first(id: session[:space_id]).owner,
                   type: params[:type])
    erb :'messages/confirmation'
  end

  get '/inbox' do
    @messages = Message.all(receiver_id: current_user.id)
    erb :'messages/inbox'
  end
end
