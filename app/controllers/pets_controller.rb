class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def filter_by_shelter
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end
end
