class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequest //to keep it from conflicting with http request/response stuff.
  has_many :bands, through: :gigs
end
