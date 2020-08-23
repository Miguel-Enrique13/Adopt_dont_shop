require 'rails_helper'

describe 'shelters index page', type: :feature do
    it 'can show the name of each shelter in the system' do
        shelter_1 = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
        shelter_2 = Shelter.create!(name: 'Second Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)

        visit "/shelters"

        expect(page).to have_content(shelter_1.name)
        expect(page).to have_content(shelter_2.name)
    end

    it 'can edit shelters from the index page' do
      shelter_1 = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)

      visit "/shelters"

      click_on "Update"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    end

    it 'can delete shelters from the index page' do
      shelter_1 = Shelter.create!(name: 'First Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)

      visit "/shelters"

      click_on "Delete"

      expect(current_path).to eq("/shelters")

      expect(page).not_to have_content("#{shelter_1.name}")
    end
end
