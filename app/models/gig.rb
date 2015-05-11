class Gig < ActiveRecord::Base

  belongs_to :venue
  has_many :bands
  has_many :users

  validates :description, presence: true,
                          length: { minimum: 8 }

  validates :event, presence: true,
                          length: { maximum: 20 }

  validates :age, presence: true

  validates :price, presence: true,
                              length: { minimum: 1 }

  validates :user_id, presence: true

end
