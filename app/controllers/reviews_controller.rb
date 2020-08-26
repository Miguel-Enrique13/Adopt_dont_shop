class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    review = Review.new(review_params)
    if !review.save 
      flash[:notice] = "Review not created: Required information missing OR Rating is above 5"
      redirect_to "/shelters/#{review.shelter_id}/reviews/new"
    else
      redirect_to "/shelters/#{params[:shelter_id]}"
    end
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end
end
