require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime, :required => true, :unique => true

  belongs_to :space
end
