class Makersbnb < Sinatra::Base
  register Sinatra::Partial

  enable :partial_underscore

  run! if app_file == $PROGRAM_NAME
end
