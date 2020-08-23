require 'rails_helper'

describe 'the new page' do
  it 'has a form to create a new pet' do
    shelter = Shelter.create!(name: 'Cat Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)

    visit "/shelters/#{shelter.id}/pets"

    click_on 'Create Pet'

    expect(current_path).to eq('/shelters/:shelter_id/pets/new')

    image = 'img001.png'
    name = 'Harley'
    description = 'The friendliest girl out there'
    sex = 'Female'
    adoption_status = 'Adoptable'

    fill_in 'Image', with: image
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Sex', with: sex

    click_on 'Create Pet'

    expect(current_path).to eq("/shelters/#{shelter.id}/pets")

    expect(page).to have_content(image)
    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(sex)
    expect(page).to have_content(adoption_status)
  end
end
