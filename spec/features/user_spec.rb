require_relative '../../app/models/user'

feature 'User can sign up' do
  scenario 'signing up adds user to database' do
    visit('/signup')
    fill_in('username', with: 'colin')
    fill_in('email', with: 'colin@email.com')
    fill_in('full_name', with: 'colin scally')
    fill_in('contact_number', with: '12345')
    fill_in('password', with: 'abc123')
    expect { click_button('Sign up') }.to change { User.count } .by 1
  end

  scenario 'user redirected to welcome page' do
    visit('/signup')
    fill_in('username', with: 'colin')
    fill_in('email', with: 'colin@email.com')
    fill_in('full_name', with: 'colin scally')
    fill_in('contact_number', with: '12345')
    fill_in('password', with: 'abc123')
    click_button('Sign up')
    expect(page).to have_content 'Welcome, colin!'
  end

  scenario 'user can set a password which is hashed in the database' do
    visit '/signup'
    fill_in('email', with: 'a@b.com')
    fill_in('full_name', with: 'Michael Bluth')
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Sign up')
    expect(User.last.password_digest).not_to eq('abc123')
  end

end
