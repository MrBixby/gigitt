class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequests
  has_many :bands, through: :gigrequests
  has_one :gig, dependent: :destroy

  accepts_nested_attributes_for :gig

  validates :date, presence: true

  validates :start_time, presence: true

  validates :doors, presence: true

  scope :upcoming, -> {where('date >= ?', Date.today).order(date: :desc)}
  scope :pending, -> {joins(:gig).where('is_final = ?', false)}
  scope :finalized, -> {joins(:gig).where('is_final = ?', true)}
  scope :past, -> {where('date <= ?', 1.week.ago).order(date: :desc)}
  scope :present, -> {where('date >= ? AND date <= ?', 1.week.ago, 1.week.from_now,).order(:date)}
  scope :future, -> {where('date >= ?', 1.week.from_now).order(:date)}



  def band_options
    b = self.bands.pluck("name", "id")
    if b.empty?
      return ["No Bands Available"]
    end
    return b
  end
end
