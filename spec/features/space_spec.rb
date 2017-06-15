feature 'Space' do
  scenario 'A space is shown on the list' do
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-01-18',
                 available_to: '17-01-18')
    show_space
    expect(page).to have_content('Room1' && '2 x 2' && 30 &&
                                 '12-01-18' && '17-01-18')
  end

  scenario 'multiple spaces can be listed' do
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-01-18',
                 available_to: '17-01-18')
    Space.create(name: 'Room2', description: '4 x 4',
                 price: 75, available_from: '05-03-18',
                 available_to: '06-03-18')
    show_space
    expect(page).to have_content('Room1' && '2 x 2' &&
                                 30 && '12-01-18' &&
                                 '17-01-18')
    expect(page).to have_content('Room2' && '4 x 4' &&
                                 75 && '05-03-18' &&
                                 '06-03-18')
  end

  scenario 'Create a new space' do
    sign_up
    click_button('Sign up')
    add_new_space
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Room3' && '3 x 3' &&
                                 100 && '12-01-18' &&
                                 '17-01-18')
  end

  scenario 'user can choose to rent or host a space' do
    sign_up
    click_button('Sign up')
    expect(page.status_code).to eq 200
    expect(page).to have_button('Rent')
    expect(page).to have_button('Host')
  end

  scenario 'user chooses to rent and sees list of spaces' do
    Space.create(name: 'Room1', description: '2 x 2',
                 price: 30, available_from: '12-01-18',
                 available_to: '17-01-18')
    sign_up
    click_button('Sign up')
    click_button('Rent')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Room1' && '2 x 2' &&
                                 30 && '12-01-18' &&
                                 '17-01-18')
  end

  scenario 'user chooses to host and lands on host portal' do
    sign_up
    click_button('Sign up')
    click_button('Host')
    expect(page).to have_button('Add new space')
    expect(page).to have_button('Update my spaces')
  end

  scenario 'user chooses to add a new space' do
    sign_up
    click_button('Sign up')
    click_button('Host')
    click_button('Add new space')
    expect(page).to have_button('Submit new space')
  end

  scenario 'a user can only select their own spaces for updating' do
    sign_up
    click_button('Sign up')
    add_space
    visit('/logout')
    sign_up2
    click_button('Sign up')
    add_space2
    visit('/spaces/update')
    expect(page).to have_content('Space 2')
    expect(page).not_to have_content('Space 1')
    expect(page).to have_button('Update')
  end

  scenario 'User can update space properties' do
    sign_up
    click_button('Sign up')
    add_space
    visit('/welcome')
    click_button('Host')
    click_button('Update my spaces')
    click_button('Update')
    fill_in('name', with: 'Space 3')
    click_button('Update space')
    visit('/spaces/show')
    expect(page).to have_content('Space 3')
  end
end
