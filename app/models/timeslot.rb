class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequests
  has_many :bands, through: :gigrequests
  has_one :gig, dependent: :destroy

  accepts_nested_attributes_for :gig

  validates :date, presence: true

  validates :start_time, presence: true

  validates :doors, presence: true

  scope :upcoming, -> {where('date >= ?', Date.today)}
  scope :pending, -> {where.not(id: Gig.select(:timeslot_id))}
  scope :past, -> {where('date <= ?', 1.week.ago)}
  scope :present, -> {where('date >= ? AND date <= ?', 1.week.ago, 1.week.from_now)}
  scope :future, -> {where('date <= ?', 1.week.from_now)}

  def band_options
    b = self.bands.pluck("id", "name")
    if b.empty?
      return ["No Bands Available"]
    end
    return b
  end
end
