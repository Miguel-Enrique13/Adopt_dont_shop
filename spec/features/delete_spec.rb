# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
require 'rails_helper'

describe 'As a user', type: :feature do
  it 'I can delete a shelter' do
    shelter = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)

    visit "/shelters/#{shelter.id}"

    click_on 'Delete Shelter'

    expect(current_path).to eq('/shelters')

    expect(page).not_to have_content(shelter.name)
  end
end
