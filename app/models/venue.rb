class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :users
  has_many :timeslots, dependent: :destroy

  acts_as_followable

  validates :name, presence: true,
                      uniqueness: true,
            length: { maximum: 60 }
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

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
      if t.gig.is_final
        gigs << t.gig
      end
    end
    return gigs.compact
  end
end
