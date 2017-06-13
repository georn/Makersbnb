class Makersbnb < Sinatra::Base

  register Sinatra::Partial

  enable :partial_underscore

  get '/' do
    "Hello world"
  end

  run! if app_file == $0
end
