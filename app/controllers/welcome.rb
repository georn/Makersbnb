class Makersbnb < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user])
    end
  end

  get '/welcome' do
    @current_user = current_user
    erb :welcome
  end
end
