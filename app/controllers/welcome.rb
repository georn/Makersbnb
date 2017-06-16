class Makersbnb < Sinatra::Base
  enable :sessions

  get '/welcome' do
    @current_user = current_user
    erb :welcome, :layout => :'bootstrap/welcome_styling'
  end
end
