class Makersbnb < Sinatra::Base
  get '/booking/new' do
    @space_id = params[:space_id]
    erb :'bookings/new'
  end

  post '/booking/new' do
    user_id = current_user.id
    space = Space.get(params[:space_id])
    host = space.owner
    session[:space_id] = space.id
    book_from = Date.parse(params[:book_from])
    book_to = Date.parse(params[:book_to])
    return 'Chosen date is not available' unless space.available?(book_from, book_to)
    return 'Is already booked' if Booking.booked?(book_from, book_to, space)
    Pendingbooking.make_bookings(book_from, book_to, space, user_id, host)
    redirect '/message'
  end

  get '/booking/pendingbooking' do
    @host_space = Pendingbooking.all(host: current_user.id)
    @guest_space = Pendingbooking.all(guest: current_user.id)
    erb :'bookings/pendingbookings'
  end

  post '/booking/approve' do
    space = Pendingbooking.first(:id => params[:space_id])
    date = space.date
    spaceid = space.space_id
    guest = space.guest
    host = space.host
    Booking.create(date: date, space_id: spaceid, guest: guest, host: host)
    Message.create(text: 'Looking forward to it! :)', sender_id: host, receiver_id: guest, type: 'approval')
    space.destroy
    erb :'bookings/approve'
  end

  post '/booking/reject' do
    space = Pendingbooking.first(:id => params[:space_id])
    guest = space.guest
    host = space.host
    Message.create(text: 'Sorry :(', sender_id: host, receiver_id: guest, type: 'rejection')
    space.destroy
    erb :'bookings/reject'
  end

  get '/booking/approvedbooking' do
    @host_space = Booking.all(host: current_user.id)
    @guest_space = Booking.all(guest: current_user.id)
    erb :'bookings/approvedbookings'
  end
end
