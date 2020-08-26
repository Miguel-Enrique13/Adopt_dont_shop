require 'rails_helper'

describe 'As a user', type: :feature do
  it 'I can delete a review' do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'img001.png', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'img002.png',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)

    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review1.content)

    within("#Review-Card-#{@review1.id}") do
      click_on 'Delete Review'
    end

    expect(page).not_to have_content(@review1.title)
    expect(page).not_to have_content(@review1.rating)
    expect(page).not_to have_content(@review1.content)
  end
end
