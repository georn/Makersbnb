feature 'booking' do

  scenario 'user can make a booking request' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    expect(page).to have_content('Booked.')
  end

  scenario 'User can not double book' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    expect(page).to have_content('Is already booked')
  end

  scenario 'User can not choose outside the available dates for rent' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '13-01-18')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '12-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    visit('/spaces')
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '11-01-18')
    fill_in('book_to', with: '13-01-18')
    click_button('Make a booking')
    expect(page).to have_content('Chosen date is not available')
  end

end
