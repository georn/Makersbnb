feature 'Booking' do
  scenario 'User can not double book' do
    sign_up
    click_button("Sign up")
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-07-17',
                 available_to: '13-07-17')
    booking_a_space
    visit('/logout')
    sign_up2
    click_button("Sign up")
    booking_a_space
    expect(page).to have_content('Is already booked')
  end

  scenario 'User can not choose outside the available dates for rent' do
    sign_up
    click_button("Sign up")
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-01-18',
                 available_to: '13-01-18')
    booking_a_space
    initialize_booking
    fill_in('book_from', with: '11-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    expect(page).to have_content('Chosen date is not available')
  end

  scenario 'User makes a booking request' do
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-07-2017',
                 available_to: '13-07-2017')
    sign_up
    click_button("Sign up")
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-07-2017')
    fill_in('book_to', with: '13-07-2017')
    expect { click_button('Make a booking') }.to change { Pendingbooking.count }.by(2)
  end

  scenario 'user can see their pending bookings as a guest' do
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-07-2017',
                 available_to: '13-07-2017')
    sign_up
    click_button("Sign up")
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-07-2017')
    fill_in('book_to', with: '13-07-2017')
    click_button('Make a booking')
    visit('/booking/pendingbooking')
    expect(page).to have_content('Room1')
  end

  scenario 'user can approve pending bookings as a host' do
    sign_up
    click_button("Sign up")
    add_space
    visit '/logout'
    sign_up2
    click_button("Sign up")
    booking_a_space
    visit '/logout'
    visit '/login'
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Login')
    visit('/booking/pendingbooking')
    expect { click_button('approve') }.to change { Booking.count }.by(1)
    expect { click_button('approve') }.to change { Pendingbooking.count }.by(-1)
  end

  scenario 'user can reject pending bookings as a host' do
    sign_up
    click_button("Sign up")
    add_space
    visit '/logout'
    sign_up2
    click_button("Sign up")
    booking_a_space
    visit '/logout'
    visit '/login'
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Login')
    visit('/booking/pendingbooking')
    expect { click_button('reject') }.to change { Pendingbooking.count }.by(-1)
  end

  scenario 'user can see their approved bookings as a host' do
    sign_up
    click_button("Sign up")
    add_space
    visit '/logout'
    sign_up2
    click_button("Sign up")
    booking_a_space
    visit '/logout'
    visit '/login'
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Login')
    visit('/booking/pendingbooking')
    click_button('approve')
    visit('/booking/approvedbooking')
    expect(page).to have_content('Room 1')
  end

end
