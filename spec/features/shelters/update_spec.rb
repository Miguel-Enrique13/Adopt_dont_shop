# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
require 'rails_helper'

describe 'As a user', type: :feature do
  it 'I can update a shelter' do
    shelter = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)

    visit "/shelter/#{shelter.id}"

    click_on 'Update Shelter'

    expect(current_path).to eq('/shelters/edit')

    fill_in 'Name', with: 'NEW First Shelter'
    fill_in 'Address', with: 'NEW 1st St.'
    fill_in 'City', with: 'NEW Bakersfield'
    fill_in 'State', with: 'NEW CA'
    fill_in 'Zip', with: 99993303

    click_on 'Update Shelter'

    visit "/shelter/#{shelter.id}"

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
    expect(page).to have_content(shelter.city)
    expect(page).to have_content(shelter.state)
    expect(page).to have_content(shelter.zip)
  end
end
