class Bandlist < ActiveRecord::Base

  belongs_to :band
  belongs_to :gig
  has_many :songs, through: :setlist

  scope :unfilled, -> { where(hired: false) }
  scope :filled, -> { where(hired: true) }
end
