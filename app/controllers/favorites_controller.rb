class FavoritesController < ApplicationController
  def new
    pet = Pet.find(params[:pet_id])
    @favorite = Favorite.new(session[:favorites])

    flash[:blue] = "Pet is already a Favorite" if @favorite.check(pet.id)
    flash[:yellow] = "Pet has been added to favorites" unless @favorite.check(pet.id)

    @favorite.add_favorite(pet.id)

    session[:favorites] = @favorite.content

    redirect_to "/pets/#{pet.id}"
  end

  def show
    flash.now[:red] = "You have NOT added any pets to favorite" if (session[:favorites] == nil || session[:favorites] == [])
  end

  def destroy
    session[:favorites].delete_if { |pet| pet.to_s == params[:pet_id] }
    flash[:red] = "You have no favorite pets" if session[:favorites].count == 0
    redirect_to '/favorites'
  end

  def destroy_all
    session[:favorites] = []
    flash.now[:red] = "You have no favorite pets"
    redirect_to '/favorites'
  end

end
