class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequests
  has_one :gig
end
