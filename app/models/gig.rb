class Gig < ActiveRecord::Base

  has_many :bands
  has_one :timeslot

  validates :description, presence: true,
                          length: { minimum: 8 }

  validates :event, presence: true,
                          length: { maximum: 20 }

  validates :age, presence: true

  validates :price, presence: true,
                              length: { minimum: 1 }

  validates :user_id, presence: true

end
