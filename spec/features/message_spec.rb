

feature 'User can create a message' do
  scenario 'booking for a room allows us to send a message' do
    sign_up
    click_button('Sign up')
    add_space
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('available_from', with:'01/06/2017')
    fill_in('available_to', with:'02/06/2017')
    click_button('Make a booking')
    expect(page.status_code).to eq 200
    fill_in('message', with:'Hi, my name is Prabu and I would like to book your space')
    click_button('Send Message')
    expect(page).to have_content('Message sent!')
  end

end

feature 'User can send a message and retrieve it' do
  scenario 'user can send a message to itself' do
    sign_up
    click_button('Sign up')
    add_space
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('available_from', with:'01/06/2017')
    fill_in('available_to', with:'02/06/2017')
    click_button('Make a booking')
    fill_in('message', with:'Hi, my name is Prabu and I would like to book your space')
    click_button('Send Message')
    visit('/inbox')
    expect(status_code).to eq(200)
    expect(page).to have_content('Hi, my name is Prabu and I would like to book your space')


  end
end
