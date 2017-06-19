require 'data_mapper'
require 'dm-postgres-adapter'

class Pendingbooking
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime, required: true
  property :guest, String
  property :host, String

  belongs_to :space

  def self.make_bookings(book_from, book_to, space, guest, host)
    cur_date = book_from
    while cur_date <= book_to do
      Pendingbooking.create(date: cur_date, space: space, guest: guest, host: host)
      cur_date += 1
    end
  end
end
