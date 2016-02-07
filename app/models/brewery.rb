class Brewery < ActiveRecord::Base
  include AverageRating
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1024,
                                   less_than_or_equal_to: 2016,
                                   only_integer: true}

  def print_report
    puts self.name
    puts "established at year #{self.year}"
    puts "number of beers #{self.beers.count}"
  end

  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end

  def average_rating2
    arr = []
    for r in self.ratings.each
      arr.push r.score
    end
    b = arr.inject{ | sum, el| sum + el }.to_f / arr.size
    return b
  end
end
