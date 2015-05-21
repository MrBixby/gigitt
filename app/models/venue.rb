class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :users
  has_many :timeslots, dependent: :destroy

  validates :name, presence: true,
                      uniqueness: true,
            length: { maximum: 60 }

  ["past", "present", "future", "upcoming"].each do |action|
    define_method ("#{action}_gigs") do
      openings = self.timeslots.send("#{action}")
      gigs = gig_list(openings)
      return gigs
    end
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
