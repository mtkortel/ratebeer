class Rating < ActiveRecord::Base
  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  scope :recent, -> {
    order(created_at: :desc).limit(5)
  }

  belongs_to :beer
  belongs_to :user

  def to_s
    "#{beer.name} #{score}"
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Rating.all.sort_by{ |b| -(b.score||0) }
    sorted_by_rating_in_desc_order.first n
    # palauta listalta parhaat n kappaletta
    # miten? ks. http://www.ruby-doc.org/core-2.1.0/Array.html
    # vaatii sen että jokaisella panimolla on ainakin yksi olut ja
    # sillä reittaus
  end
end
