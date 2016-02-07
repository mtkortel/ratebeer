class User < ActiveRecord::Base
  validates :usernane, uniqueness: true,
                       length: { in: 3..15 }

  has_many :ratings # käyttäjällä on monta ratingia

end
