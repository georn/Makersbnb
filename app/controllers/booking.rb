class Makersbnb < Sinatra::Base

  get '/booking/new' do
    @space_id = params[:space_id]
    erb :'bookings/new'
  end

  post '/booking/new' do
    space = Space.get(params[:space_id])
    book_from = Date.parse(params[:book_from])
    book_to = Date.parse(params[:book_to])
    raise 'Chosen date is not available' if !space.available?(book_from, book_to)
    cur_date = book_from
    while cur_date <= book_to do
      count = Booking.count(:date => cur_date, :space => space)
      if count != 0 then
        raise "#{cur_date} is already booked (#{count})"
      end
      puts "count for #{cur_date} is #{count}"
      cur_date += 1
    end
    cur_date = book_from
    while cur_date <= book_to do
      Booking.create(:date => cur_date, :space => space)
      cur_date += 1
    end
    'Booked.'
  end
end
