require 'rails_helper'

describe "I navigate to Pets show page" do
  before :each do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'dog1.jpg', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'cat1.jpg',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)
  end

  describe "I click favorites on the navbar" do
    it "I am taken to the favorites show page" do
      visit "/pets/#{@pet1.id}"
      click_on "Favorite Me!"

      within("#NavBar") do
        click_on 'Favorites: 1'
      end

      expect(current_path).to eq("/favorites")
      expect(page).to have_link(@pet1.name)
    end
  end
end
