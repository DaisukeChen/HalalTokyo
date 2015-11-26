class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking
  def ranking
    restaurant_ids = Review.group(:restaurant_id).order('count_restaurant_id DESC').limit(5).count(:restaurant_id).keys
    @ranking = restaurant_ids.map {|id| Restaurant.find(id)}
  end
end
