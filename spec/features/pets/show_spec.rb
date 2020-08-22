require 'rails_helper'

describe 'the pet show page' do
  it 'shows the pet with that id and its info' do
    shelter = Shelter.create!(name: 'Cat Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)
    pet = Pet.create!(image: 'img001.png', name: 'Lukas', age: 10, sex: 'Male', shelter: shelter)

    visit "/pets/#{pet.id}"

    save_and_open_page

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.shelter.name)
  end
end
