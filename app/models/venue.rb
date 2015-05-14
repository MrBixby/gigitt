class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :users
  has_many :timeslots, dependent: :destroy
  def upcoming_gigs
    gigs = []
    openings = self.timeslots.where('date >= ?', Date.today)
    openings.each do |t|
      gigs << t.gig
    end
    return gigs.compact
  end
end
