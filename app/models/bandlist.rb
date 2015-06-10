class Bandlist < ActiveRecord::Base
  belongs_to :band
  belongs_to :gig

  scope :unfilled, -> { where(hired: false) }
  scope :filled, -> { where(hired: true) }
end
