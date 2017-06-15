
def sign_up
  visit '/'
  fill_in('email', with: 'a@b.com')
  fill_in('full_name', with: 'Michael Bluth')
  fill_in('username', with: 'hermano')
  fill_in('password', with: 'abc123')
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

def booking_a_space
  initialize_booking
  fill_in('book_from', with: '12-01-18')
  fill_in('book_to', with: '13-01-18')
  click_button('Make a booking')
end

def initialize_booking
  visit('/spaces')
  click_button('Show list of spaces')
  click_button('Book')
end
