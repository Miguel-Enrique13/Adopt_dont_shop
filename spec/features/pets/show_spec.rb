require 'rails_helper'

describe 'the pet show page' do
  it 'shows the pet with that id and its info' do
    shelter = Shelter.create!(name: 'Cat Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)
    pet = Pet.create!(image: 'img001.png', name: 'Lukas', age: 10, sex: 'Male', shelter: shelter, description: "I'm a good boy", adoption_status: 'Adoptable')

    visit "/pets/#{pet.id}"

    save_and_open_page

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.shelter.name)
    expect(page).to have_content(pet.adoption_status)
  end

  it 'has a link to shelter show page' do
    shelter = Shelter.create!(name: 'Cat Shelter', address: '2nd St.', city: 'Los Angeles', state: 'CA', zip: 93303)
    pet = Pet.create!(image: 'img001.png', name: 'Lukas', age: 10, sex: 'Male', shelter: shelter, description: "I'm a good boy", adoption_status: 'Adoptable')

    visit "/pets/#{pet.id}"

    click_on "#{shelter.name}"

    expect(current_path).to eq("/shelters/#{shelter.id}")
  end
end
