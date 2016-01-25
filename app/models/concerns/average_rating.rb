module AverageRating
  extend ActiveSupport::Concern

  def average_rating
    arr = []
    for r in self.ratings.each
      arr.push r.score
    end
    b = arr.inject{ | sum, el| sum + el }.to_f / arr.size
    return b
  end
end