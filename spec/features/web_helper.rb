
def sign_up
  visit '/'
  fill_in('email', with: 'a@b.com')
  fill_in('full_name', with: 'Michael Bluth')
  fill_in('username', with: 'hermano')
  fill_in('password', with: 'abc123')
end
