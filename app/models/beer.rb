class Beer < ActiveRecord::Base
  include AverageRating
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  validates :name, presence: true



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

  def average
    return 0 if ratings.empty?
    ratings.map { |r| r.score}.sum / ratings.count.to_f
  end

end




# Yksinkertainen suojaus