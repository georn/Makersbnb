
def sign_up
  visit '/'
  fill_in('email', with: 'a@b.com')
  fill_in('full_name', with: 'Michael Bluth')
  fill_in('username', with: 'hermano')
  fill_in('password', with: 'abc123')
  fill_in('password_confirmation', with: 'abc123')
end

def sign_up2
  visit '/'
  fill_in('email', with: '12121.com')
  fill_in('full_name', with: 'Bob Dave')
  fill_in('username', with: 'Bob')
  fill_in('password', with: 'abc123')
  fill_in('password_confirmation', with: 'abc123')
end

def invalid_sign_up
  visit '/'
  fill_in('email', with: 'a@b.com')
  fill_in('full_name', with: 'Michael Bluth')
  fill_in('username', with: 'hermano')
  fill_in('password', with: 'abc123')
  fill_in('password_confirmation', with: 'abc12')
end

def add_space
  visit '/spaces/new'
  fill_in('name', with: 'Space 1')
  fill_in('description', with: 'Description 1')
  fill_in('price', with: '1')
  fill_in('available_from', with: '01/01/2017')
  fill_in('available_to', with: '01/01/2018')
  click_button('Submit new space')
end

def add_space2
  visit '/spaces/new'
  fill_in('name', with: 'Space 2')
  fill_in('description', with: 'Description 2')
  fill_in('price', with: '2')
  fill_in('available_from', with: '01/01/2017')
  fill_in('available_to', with: '01/01/2017')
  click_button('Submit new space')
end

def show_space
  visit('/spaces')
  expect(page.status_code).to eq 200
  click_button('Show list of spaces')
end

def add_new_space
  visit('/spaces')
  click_button('Add a new space')
  fill_in('name', with: 'Room3')
  fill_in('description', with: '3 x 3')
  fill_in('price', with: '100')
  fill_in('available_to', with: '12-01-18')
  fill_in('available_from', with: '17-01-18')
  click_button('Submit new space')
end

def booking_a_space
  initialize_booking
  fill_in('book_from', with: '12-07-17')
  fill_in('book_to', with: '13-07-17')
  click_button('Make a booking')
end

def initialize_booking
  visit('/spaces')
  click_button('Show list of spaces')
  click_button('Book')
end
