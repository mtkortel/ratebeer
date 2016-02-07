class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user # kuuluu myös käyttäjälle

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true}

  def to_s
    return "#{beer.name} #{score}"
  end

  def user_average_rating
    arr = []
    for r in self.ratings.each
      arr.push r.score
    end
    b = arr.inject{ | sum, el| sum + el }.to_f / arr.size
    return b
  end

end
