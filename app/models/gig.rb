class Gig < ActiveRecord::Base

  validates :description, presence: true,
                          length: { minimum: 8 }

  validates :event, presence: true,
                          length: { maximum: 20 }

  validates :age, presence: true

  validates :band, presence: true

  validates :price, presence: true,
                              length: { minimum: 1 }

  validates :user_id, presence: true

    has_many :band
    has_many :user
    has_one :user
end
