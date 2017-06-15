require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :full_name, String
  property :contact_number, String
  property :password_digest, Text

  has n, :spaces, through: Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
