class Venue < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :gigs, dependent: :destroy

  acts_as_followable

  validates :name, presence: true,
                      uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  ["past", "present", "future", "upcoming"].each do |action|
    define_method ("#{action}_gigs") do
      openings = self.gigs.send("#{action}")
      return openings.finalized
    end
  end

end
