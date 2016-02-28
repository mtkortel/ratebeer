module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    if ratings.count > 0
      ratings.inject(0.0){ |sum, r| sum+r.score } / ratings.count
    else
      return 0.0
    end
  end
end