class  Makersbnb < Sinatra::Base

  post '/signup' do
    user = User.create(email: params[:email], username: params[:username], full_name: params[:full_name], contact_number: params[:contact_number], password: params[:password])
    session[:user] = user.id
    redirect to('/welcome')
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.first(username: params[:username])
    if BCrypt::Password.new(user.password_digest) == params[:password]
      session[:user] = user.id
      redirect to('/welcome')
    else
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user])
    end
  end
end
