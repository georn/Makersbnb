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



end
