ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/partial'

require_relative 'data_mapper_setup.rb'
require_relative 'models/user'

require_relative 'server'
require_relative 'controllers/spaces.rb'
require_relative 'controllers/users.rb'
