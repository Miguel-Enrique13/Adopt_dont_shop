require 'rails_helper'

describe 'the welcome page' do
  it 'greets the user' do
    visit "/"

    expect(page).to have_content("Welcome")
  end
end
