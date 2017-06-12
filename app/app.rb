ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Makersbnb < Sinatra::Base

  get '/' do

  end

  run! if app_file == $0
end
