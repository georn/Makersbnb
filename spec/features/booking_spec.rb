feature 'booking' do
  scenario 'user can make a booking request' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('available_to', with: '12-01-18')
    fill_in('available_from', with: '13-01-18')
    # Booking.create(date: '12-01-18')
    # Booking.create(date: '13-01-18')
    expect(page).to have_content('12-01-18')
  end
end