class  Makersbnb < Sinatra::Base
  post '/signup' do
    user = User.new(email: params[:email],
                       username: params[:username],
                       full_name: params[:full_name],
                       contact_number: params[:contact_number],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.valid?
      user.save
      session[:user] = user.id
      redirect to('/welcome')
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/index'
    end
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
