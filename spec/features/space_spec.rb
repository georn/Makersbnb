

feature 'Space' do
  it 'A space is shown on the list' do
    Space.create(name: 'Room1', description: '2 x 2', price: 30)
    visit('/spaces')
    expect(page.status_code).to eq 200
    click_button('Show list of spaces')
    expect(page).to have_content('Room1' && '2 x 2' && 30)
  end

end
