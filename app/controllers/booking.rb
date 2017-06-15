class Makersbnb < Sinatra::Base

  get '/booking/new' do
    @space_id = params[:space_id]
    erb :'bookings/new'
  end

  post '/booking/new' do
    space = Space.get(params[:space_id])
    book_from = Date.parse(params[:book_from])
    book_to = Date.parse(params[:book_to])
    return 'Chosen date is not available' if !space.available?(book_from, book_to)
    return 'Is already booked' if Booking.booked?(book_from, book_to, space)
    Booking.make_bookings(book_from, book_to, space)
    redirect ('/message')
  end

end
