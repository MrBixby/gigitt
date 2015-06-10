class Band < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :bandlists
  has_many :gigs, through: :bandlists
  has_many :fans

  acts_as_follower
  acts_as_followable

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :city, presence: true
  validates :zip, presence: true

  def applied_gigs
  end

  def available_gigs
    gigs = []
    self.followees(Venue).each do |venue|
      pgig = venue.gigs.upcoming.pending
      pgig.each do |p|
        filled_spots = p.bandlists.filled.count
        if p.openings > filled_spots
          gigs << p
        end
      end
    end
    return gigs.compact
  end

  def booked_gigs
    @booked_gig = []
    hired_gigs = self.bandlists.filled
    hired_gigs.each do |set|
     if set.gig.date >= Date.today
      @booked_gigs << set.gig
     end
    end
  end

end
