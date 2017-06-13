class  Makersbnb < Sinatra::Base
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(email: params[:email], username: params[:username], full_name: params[:full_name], contact_number: params[:contact_number], password: params[:password])
  end
end
