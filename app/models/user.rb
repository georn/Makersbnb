require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, :unique => true
  property :username, String, required: true, :unique => true
  property :full_name, String
  property :contact_number, String
  property :password_digest, Text

  validates_presence_of :email, as: :email_address
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_confirmation_of :password

  has n, :spaces, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
