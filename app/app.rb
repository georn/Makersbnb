ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/partial'


require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/booking'
require_relative 'data_mapper_setup.rb'

require_relative 'server'
require_relative 'controllers/spaces.rb'
require_relative 'controllers/users.rb'
require_relative 'controllers/welcome.rb'
require_relative 'controllers/booking.rb'
require_relative 'controllers/messages.rb'
