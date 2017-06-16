class Makersbnb < Sinatra::Base
  enable :sessions

  get '/welcome' do
    @current_user = current_user
    erb :welcome
  end
end
