class Makersbnb < Sinatra::Base
  register Sinatra::Partial

  enable :partial_underscore

  get '/' do
    erb :'users/index'
  end

  run! if app_file == $PROGRAM_NAME
end
