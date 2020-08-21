require 'rails_helper'

describe 'New Shelter', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new shelter by clicking a link on the index' do
      it 'I can create a new shelter' do

        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: 'First Shelter'
        fill_in 'Address', with: '1st St.'
        fill_in 'City', with: 'Bakersfield'
        fill_in 'State', with: 'CA'
        fill_in 'Zip', with: 93303

        save_and_open_page

        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters')
        expect(page).to have_content('First Shelter')
        expect(page).to have_content('1st St.')
        expect(page).to have_content('Bakersfield')
        expect(page).to have_content('CA')
        expect(page).to have_content(93303)
      end
    end
  end
end
