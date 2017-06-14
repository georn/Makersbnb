require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :description, Text
  property :price, Numeric, :required => true
  property :available_to, Date, :required => true
  property :available_from, Date, :required => true
  property :owner, String

  has n, :bookings

end
