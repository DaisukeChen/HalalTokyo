class ReviewsController < ApplicationController
 before_action :authenticate_user!, only: :new

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create  
    Review.create(create_params)
    redirect_to controller: :restaurants, action: :index
  end

  private
  def create_params
      params.require(:review).permit(:rate, :review).merge(restaurant_id: params[:restaurant_id], user_id: current_user.id)
  end
end

