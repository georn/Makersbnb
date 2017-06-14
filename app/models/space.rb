require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Numeric
  property :available_to, Date
  property :available_from, Date
  property :owner, String

  has n, :bookings

end
