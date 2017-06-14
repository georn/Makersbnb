require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime, :required => true

  belongs_to :space


  def self.booked?(book_from, book_to, space)
    cur_date = book_from
    while cur_date <= book_to do
      count = Booking.count(:date => cur_date, :space => space)
      return true if count != 0
      cur_date += 1
    end
    return false
  end



end
