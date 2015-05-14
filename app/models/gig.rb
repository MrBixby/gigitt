class Gig < ActiveRecord::Base

  has_and_belongs_to_many :bands
  belongs_to :timeslot

  validates :description, presence: true,
                          length: { minimum: 8 }

  validates :event, presence: true,
                          length: { maximum: 20 }

  validates :age, presence: true

  validates :price, presence: true,
                              length: { minimum: 1 }

end
