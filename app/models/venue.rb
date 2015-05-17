class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :users
  has_many :timeslots, dependent: :destroy

  validates :name, presence: true,
                      uniqueness: true,
            length: { maximum: 60 }

  def upcoming_gigs
    openings = self.timeslots.where('date >= ?', Date.today)
    gig_list(openings)
  end
  def past_gigs
    openings = self.timeslots.where('date <= ?', 1.week.ago)
    gig_list(openings)
  end
  def present_gigs
    openings = self.timeslots.where('date >= ? AND date <= ?', 1.week.ago, 1.week.from_now)
    gig_list(openings)
  end
  def future_gigs
    openings = self.timeslots.where('date <= ?', 1.week.from_now)
    gig_list(openings)
  end

  private
  def gig_list(openings)
    gigs = []
    openings.each do |t|
      gigs << t.gig
    end
    return gigs.compact
  end
end
