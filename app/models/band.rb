class Band < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :venues
  has_many :gigrequests, dependent: :destroy
  has_and_belongs_to_many :gigs
  has_many :fans

  validates :name, presence: true
  validates :genre, presence: true
  validates :city, presence: true
  validates :zip, presence: true

end
