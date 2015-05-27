class Band < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :venues
  has_many :gigrequests
  has_many :timeslots, through: :gigrequests
  has_and_belongs_to_many :gigs
  has_many :fans

  acts_as_follower
  acts_as_followable

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :city, presence: true
  validates :zip, presence: true

end
