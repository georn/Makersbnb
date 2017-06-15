feature 'booking' do

  scenario 'user can make a booking request' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    booking_a_space
    expect(page).to have_content('Booked.')
  end

  scenario 'User can not double book' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    booking_a_space
    booking_a_space
    expect(page).to have_content('Is already booked')
  end

  scenario 'User can not choose outside the available dates for rent' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    booking_a_space
    booking_the_space
    expect(page).to have_content('Chosen date is not available')
  end

end
