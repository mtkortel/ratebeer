class Beer < ActiveRecord::Base
  include AverageRating
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  # @return [Object]
  def average_rating2
    arr = []
    for r in self.ratings.each
      arr.push r.score
    end
    b = arr.inject{ | sum, el| sum + el }.to_f / arr.size
    return b
  end

  def to_s
    return "#{self.name} #{self.brewery.name}"
  end
end


# Yksinkertainen suojaus