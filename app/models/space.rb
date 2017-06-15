require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text
  property :price, Numeric, required: true
  property :available_to, Date, required: true
  property :available_from, Date, required: true
  property :owner, String

  has n, :bookings

  def available?(book_from, book_to)
    return false if book_from > book_to
    return false if book_from < available_from
    return false if book_from > available_to
    return false if book_to < available_from
    return false if book_to > available_to
    true
  end
end
