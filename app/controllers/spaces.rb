class Makersbnb < Sinatra::Base
  get '/spaces' do
    erb :'spaces/index'
  end

  get '/spaces/show' do
    @spaces = Space.all
    erb :'spaces/show'
  end

end
