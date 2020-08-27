class FavoritesController < ApplicationController
  def new
    pet = Pet.find(params[:pet_id])
    session[:favorites] ||= []
    if session[:favorites].any? { |favorite| favorite["id"] == pet.id }
      flash[:repeat] = "Pet is already a Favorite"
      redirect_to "/pets/#{pet.id}"
    else
      session[:favorites] << pet
      flash[:favorite] = "Pet has been added to favorites"
      redirect_to "/pets/#{pet.id}"
    end
  end
end
