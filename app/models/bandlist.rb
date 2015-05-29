class Bandlist < ActiveRecord::Base
  belongs_to :band
  belongs_to :gig

  scope :filled, -> { where(hired: true) }
end
