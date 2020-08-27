require 'rails_helper'

describe 'Visit the favorites show page' do
  before :each do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'dog1.jpg', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'cat1.jpg',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)
  end

  it "Then I click the 'Remove' button" do
    visit "/pets/#{@pet1.id}"
    click_on "Favorite Me!"

    visit "/pets/#{@pet2.id}"
    click_on "Favorite Me!"

    within("#NavBar") do
      click_on "Favorites: 2"
    end

    expect(current_path).to eq("/favorites")

    within("#Favorite-Card-#{@pet1.id}") do
      click_on "Remove"
    end

    expect(current_path).to eq("/favorites")

    within("#NavBar") do
      expect(page).to have_content("Favorites: 1")
    end

    within("#Favorite-Card-#{@pet2.id}") do
      click_on "Remove"
    end

    expect(current_path).to eq("/favorites")

    within("#NavBar") do
      expect(page).to have_content("Favorites:")
    end

    expect(page).to have_content("You have no favorite pets")

  end
end
