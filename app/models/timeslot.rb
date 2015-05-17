class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequests
  has_one :gig

  validates :date, presence: true

  validates :start_time, presence: true

  validates :end_time, presence: true
end
