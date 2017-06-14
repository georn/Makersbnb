class Makersbnb < Sinatra::Base

  get '/booking/new' do
    @space_id = params[:space_id]
    erb :'bookings/new'
  end

  post '/booking/new' do
    space = Space.get(params[:space_id])
    book_from = Date.parse(params[:book_from])
    book_to = Date.parse(params[:book_to])
    raise 'start date must be before to date' if book_from > book_to
    raise 'start date is not available' if book_from < space.available_from
    raise 'start date is not available' if book_from > space.available_to
    raise 'end date is not available' if book_to < space.available_from
    raise 'end date is not available' if book_to > space.available_to
    cur_date = book_from
    while cur_date <= book_to do
      if Booking.count(:date => cur_date) != 0 then
        raise "#{cur_date} is already booked"
      end
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
