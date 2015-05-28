class Band < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :gigrequests
  has_many :timeslots, through: :gigrequests
  has_and_belongs_to_many :gigs, counter_cache: :bands_count
  has_many :fans

  acts_as_follower
  acts_as_followable

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :city, presence: true
  validates :zip, presence: true

  def available_gigs
    self.followees(Venue).each do |venue|
      return venue.timeslots.unfilled.upcoming.pending
    end
  end

end
