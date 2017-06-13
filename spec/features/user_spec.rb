require_relative '../../app/models/user'

feature 'User can sign up' do
  scenario 'signing up adds user to database' do
    sign_up
    expect { click_button('Sign up') }.to change { User.count } .by 1
  end

  scenario 'user redirected to welcome page' do
    sign_up
    click_button('Sign up')
    expect(page).to have_content('Welcome, hermano!')
  end

  scenario 'user can set a password which is hashed in the database' do
    sign_up
    click_button('Sign up')
    expect(User.last.password_digest).not_to eq('abc123')
  end

end

feature 'User Login' do
  scenario 'User is able to login with valid credentials' do
    User.create(email: 'dave@dave.com', username: 'dave1', full_name: 'dave dave', password: 'abc123', contact_number: '12345' )
    visit('/')
    click_button('Login')
    fill_in('username', with: 'dave1')
    fill_in('password', with: 'abc123')
    click_button('Login')
    expect(page).to have_content('Welcome, dave1!')
  end

  scenario 'User is unable to login with invalid credentials' do
    User.create(email: 'mike@dave.com', username: 'mike1', full_name: 'mike dave', password: 'def123', contact_number: '6789' )
    visit('/')
    click_button('Login')
    fill_in('username', with: 'mike1')
    fill_in('password', with: 'WRONG')
    click_button('Login')
    expect(current_path).to eq '/login'
  end
end
