require 'rails_helper'

describe 'I open web page' do
  before :each do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'dog1.jpg', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'cat1.jpg',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)
  end
  describe "I visit the pet show page" do
    it 'I click on Favorite Pet, I see the counter on the nav bar go up, I see a flash message
    pop up saying "Pet added to Favorites" and I am taken back to pet show page' do

    visit "/pets/#{@pet1.id}"

    expect(page).to have_link("Favorite Me!")

    click_on 'Favorite Me!'

    expect(page).to have_content("Pet has been added to Favorites")

    within('#NavBar') do
      expect(page).to have_content(1)
    end

    expect(current_path).to eq("/pets/#{@pet1.id}")
    end
  end
end
