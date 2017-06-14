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
    raise 'Is already booked' if Booking.booked?(book_from, book_to, space)
    cur_date = book_from
    while cur_date <= book_to do
      Booking.create(:date => cur_date, :space => space)
      cur_date += 1
    end
    'Booked.'
  end
end
