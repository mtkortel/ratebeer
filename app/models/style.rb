class Style < ActiveRecord::Base
  include RatingAverage
  has_many :beers

  def self.top(n)

    rated = self.all{ |r| r.beer.style }.uniq
    rated.sort_by { |style| -rating_of_style(style) }.first

    #sorted_by_rating_in_desc_order = Style.all.sort_by{ |b| -(b.average_rating || 0) }
    #sorted_by_rating_in_desc_order.first n
    # palauta listalta parhaat n kappaletta
    # miten? ks. http://www.ruby-doc.org/core-2.1.0/Array.html
    # vaatii sen että jokaisella panimolla on ainakin yksi olut ja
    # sillä reittaus
  end

  private

  def rating_of_style(style)
    ratings_of = self.ratings.select{ |r| r.beer.style==style }
    ratings_of.map(&:score).inject(&:+) / ratings_of.count.to_f
  end
end
