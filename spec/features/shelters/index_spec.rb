require 'rails_helper'

describe 'shelters index page', type: :feature do
    it 'can the name of each shelter in the system' do
        shelter_1 = Shelter.create(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
        shelter_2 = Shelter.create(name: 'Second Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)

        visit "/shelters"

        expect(page).to have_content(shelter_1.name)
        expect(page).to have_content(shelter_2.name)
    end
end
