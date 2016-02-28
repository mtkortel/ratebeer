class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, presence: true
  validates :year, numericality: { less_than_or_equal_to: Proc.new { Time.now.year } }

  scope :active, -> {where active:true}
  scope :retired, -> {where active:[nil, false]}

  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  def self.top(n)
    sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.first n
    # palauta listalta parhaat n kappaletta
    # miten? ks. http://www.ruby-doc.org/core-2.1.0/Array.html
    # vaatii sen että jokaisella panimolla on ainakin yksi olut ja
    # sillä reittaus
  end
end