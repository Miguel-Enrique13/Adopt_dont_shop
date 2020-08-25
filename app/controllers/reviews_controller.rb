class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    review = Review.create!(review_params)
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end
end
