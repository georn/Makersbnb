feature 'creating a user' do

  scenario 'user visits /new and receives a form to create a peep' do
    visit '/signup'
    click_button('Submit')
    expect(page).to have_content('YO YO YO')
  end

end
