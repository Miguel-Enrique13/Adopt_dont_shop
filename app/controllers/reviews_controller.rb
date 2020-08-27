class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    review = Review.new(review_params)
    if !review.save
      flash[:red] = "Review not created: Required information missing"
      redirect_to "/shelters/#{review.shelter_id}/reviews/new"
    else
      redirect_to "/shelters/#{params[:shelter_id]}"
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    if review.update(review_params)
      redirect_to "/shelters/#{review.shelter_id}"
    else
      flash[:notice] = "Review not created: Required information missing"
      redirect_to "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = Review.find(params[:review_id])
    review.destroy
    redirect_to "/shelters/#{review.shelter_id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end
end
