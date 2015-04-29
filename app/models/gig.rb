class Gig < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true,
                          length: { minimum: 8 }

  validates :event, presence: true,
                          length: { maximum: 20 }

  validates :age, presence: true

  validates :price, presence: true,
                              length: { minimum: 1 },
                              length: { maximum: 8 }

  validates :user_id, presence: true
end
