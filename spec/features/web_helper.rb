
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
  fill_in('available_to', with: '01/01/2017')
  click_button('Submit new space')
end
