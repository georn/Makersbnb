ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require_relative 'models/user'

class Makersbnb < Sinatra::Base

  get '/' do
    "YO YO YO"
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(email: params[:email], username: params[:username], full_name: params[:full_name], contact_number: params[:contact_number], password: params[:password])
  end

  run! if app_file == $0

end
