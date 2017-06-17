require_relative '../app/models/booking.rb'
require_relative '../app/models/pendingbooking.rb'

describe Booking do


  it 'makes a new booking in the bookings database table' do
    space = double(:space, id: 1, available_from: Date.parse('01-06-2017'), available_to: Date.parse('02-06-2017'), save_parents: true, save_self: true)
    expect { Booking.make_bookings(Date.parse('01-06-2017'), Date.parse('02-06-2017'), space, 'bob', 'dave') }.to change{ Booking.count }.by(2)
    # space = instance_double(Space, id: 1, name: "House", description: "nice", price: "1", available_from:'01-06-17', available_to:'30-06-17', owner: "colin" )
  end

end

describe Pendingbooking do


  it 'makes a new booking in the pending bookings database table' do
    space = double(:space, id: 1, available_from: Date.parse('01-06-2017'), available_to: Date.parse('02-06-2017'), save_parents: true, save_self: true)
    expect { Pendingbooking.make_bookings(Date.parse('01-06-2017'), Date.parse('02-06-2017'), space, 'bob', 'dave') }.to change{ Pendingbooking.count }.by(2)
    # space = instance_double(Space, id: 1, name: "House", description: "nice", price: "1", available_from:'01-06-17', available_to:'30-06-17', owner: "colin" )
  end

end
