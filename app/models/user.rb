require_relative '../data_mapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :contact_number, String
  property :password_digest, Text

  #Will include the below line later to link the user modle to the spaces model, bookings model, etc.
  # has n, :peeps, :through => Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
