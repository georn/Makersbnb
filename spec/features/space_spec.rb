

feature 'Space' do
  scenario 'A space is shown on the list' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '17-01-18')
    visit('/spaces')
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page).to have_content('Room1' && '2 x 2' && 30 && '12-01-18' && '17-01-18')
  end

  scenario 'multiple spaces can be listed' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30, available_from: '12-01-18', available_to: '17-01-18')
    Space.create(name: 'Room2', description: '4 x 4', price: 75, available_from: '05-03-18', available_to: '06-03-18')
    visit('/spaces')
    click_button('Show list of spaces')
    expect(page).to have_content('Room1' && '2 x 2' && 30 && '12-01-18' && '17-01-18')
    expect(page).to have_content('Room2' && '4 x 4' && 75 && '05-03-18' && '06-03-18')
  end

  scenario 'Create a new space' do
    visit('/spaces')
    click_button('Add a new space')
    expect(page.status_code).to eq 200
    fill_in('name', with:'Room3')
    fill_in('description', with:'3 x 3')
    fill_in('price', with:'100')
    fill_in('available_to', with: '12-01-18')
    fill_in('available_from', with: '17-01-18')
    click_button('Submit new space')
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Room3' && '3 x 3' && 100 && '12-01-18' && '17-01-18')
  end
end
