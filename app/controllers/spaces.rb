class Makersbnb < Sinatra::Base
  get '/spaces' do
    erb :'spaces/index'
  end

  get '/spaces/show' do
    @spaces = Space.all
    erb :'spaces/show'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces'
  end


end
