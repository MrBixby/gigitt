class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequest
  has_many :bands, through: :gigs
end
