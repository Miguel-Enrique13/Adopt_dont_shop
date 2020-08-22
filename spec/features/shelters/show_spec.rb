require 'rails_helper'

describe 'shelters show page shows shelter with that id', type: :feature do
    it 'includint the name, address, city, state, and zip' do
        shelter_1 = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)

        visit "/shelters/#{shelter_1.id}"
        save_and_open_page

        expect(page).to have_content(shelter_1.name)
        expect(page).to have_content(shelter_1.address)
        expect(page).to have_content(shelter_1.city)
        expect(page).to have_content(shelter_1.state)
        expect(page).to have_content(shelter_1.zip)
    end
end
