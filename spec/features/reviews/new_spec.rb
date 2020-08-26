require 'rails_helper'

describe 'New Review', type: :feature do
  before :each do
    @shelter1 = Shelter.create!(name: 'Dog Shelter', address: '1st St.', city: 'Bakersfield', state: 'CA', zip: 93303)
    @pet1 = Pet.create!(image: 'img001.png', name: 'Olaf', age: 3, sex: 'Male', shelter: @shelter1)
    @pet2 = Pet.create!(image: 'img002.png',name: 'Kitty', age: 7, sex: 'Female', shelter: @shelter1)
    @review1 = Review.create!(title: "Great Experience!", rating: 4, content: "This shelter is Amazing", shelter: @shelter1)
    @review2 = Review.create!(title: "AMAZING!!!!!!!!!!", rating: 5, content: "This shelter is amazing look at the pup I got!!!", picture: "dog1.jpg", shelter: @shelter1)
  end

  describe 'As a visitor' do
    describe 'When I visit a shelter show page by clicking a link on the index' do
      it 'I can create a new Review' do

        visit "/shelters/#{@shelter1.id}"

        click_link 'Leave a Review!'

        expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

        fill_in 'title', with: "#{@review1.title}"
        fill_in 'rating', with: "#{@review1.rating}"
        fill_in 'content', with: "#{@review1.content}"
        fill_in 'picture', with: "#{@review1.picture}"

        click_on 'Post Review'

        save_and_open_page


        expect(current_path).to eq("/shelters/#{@shelter1.id}")
        expect(page).to have_content(@review1.title)
        expect(page).to have_content(@review1.rating)
        expect(page).to have_content(@review1.content)
        expect(page).to have_content(@review1.picture)
      end

      it "It can display a flash message when form not properly filled out" do
        visit "/shelters/#{@shelter1.id}"

        click_link 'Leave a Review!'

        click_button 'Post Review'

        expect(page).to have_content("Review not created: Required information missing OR Rating is above 5")

      end

    end
  end
end
