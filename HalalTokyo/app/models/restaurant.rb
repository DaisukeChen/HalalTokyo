class Restaurant < ActiveRecord::Base
  has_many :reviews
  def review_average
    reviews.average(:rate).round if self.reviews.present?
  end
end
