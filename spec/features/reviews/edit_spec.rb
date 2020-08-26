require 'rails_helper'

describe 'Review edit page' do
  before :each do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'img001.png', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'img002.png',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)
  end

  it 'can be accessed through Shelter show page and provides form to update pet information' do
    visit "/shelters/#{@shelter1.id}"

    within("#Review-Card-#{@review1.id}") do
      click_on 'Update Review'
    end

    expect(current_path).to eq("/reviews/#{@review1.id}/edit")

    fill_in 'title', with: "NEW TITLE FOR TESTING !!!"
    fill_in 'rating', with: 1
    fill_in 'content', with: "THIS IS THE CONTENT FOR TESTING"

    click_on 'Update Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    within("#Review-Card-#{@review1.id}") do
      expect(page).to have_content("NEW TITLE FOR TESTING !!!")
      expect(page).to have_content(1)
      expect(page).to have_content("THIS IS THE CONTENT FOR TESTING")
    end
  end
end
