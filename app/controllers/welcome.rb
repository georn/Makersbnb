class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/welcome' do
    @current_user = current_user
    erb :welcome
  end
end
