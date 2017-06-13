require_relative '../../app/models/space.rb'

feature 'Space' do
  scenario 'A space is shown on the list' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30)
    visit('/spaces')
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page).to have_content('Room1' && '2 x 2' && 30)
  end

  scenario 'multiple spaces can be listed' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30)
    Space.create(name: 'Room2', description: '4 x 4', price: 75)
    visit('/spaces')
    click_button('Show list of spaces')
    expect(page).to have_content('Room1' && '2 x 2' && 30)
    expect(page).to have_content('Room2' && '4 x 4' && 75)
  end

  scenario 'Create a new space' do
    visit('/spaces')
    click_button('Add a new space')
    expect(page.status_code).to eq 200
    fill_in('name', with:'Room3')
    fill_in('description', with:'3 x 3')
    fill_in('price', with:'100')
    click_button('Submit new space')
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page.status_code).to eq 200
    expect(page).to have_content(name: 'Room3', description: '3 x 3', price: 75)
  end


end
