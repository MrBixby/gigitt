class Gig < ActiveRecord::Base

  has_many :bandlists
  has_many :bands, through: :bandlists
  belongs_to :venue

  accepts_nested_attributes_for :bandlists
  attr_accessor :hired_bands

  validates :description, presence: true, length: { minimum: 8 }
  validates :event, presence: true, length: { maximum: 20 }
  validates :age, presence: true
  validates :price, presence: true, length: { minimum: 1 }
  validates :date, presence: true
  validates :showtime, presence: true
  validates :doors, presence: true

  scope :upcoming, -> {where('date >= ?', Date.today).order(date: :desc)}
  scope :pending, -> {where('is_final = ?', false)}
  scope :finalized, -> {where('is_final = ?', true)}
  scope :past, -> {where('date <= ?', 1.week.ago).order(date: :desc)}
  scope :present, -> {where('date >= ? AND date <= ?', 1.week.ago, 1.week.from_now,).order(:date)}
  scope :future, -> {where('date >= ?', 1.week.from_now).order(:date)}

  before_save :hire_bands

  def band_options
    b = self.bands.pluck("name", "id")
    if b.empty?
      return ["No Bands Available"]
    end
    return b
  end

  def hire_bands
    if hired_bands.present?
      hired_bands.reject!(&:empty?)
      hired_bands.each do |hb|
        band = self.bandlists.where('gig_id = ? AND band_id = ?', self.id, hb)
        band.each do |b| 
          b.update_attribute(:hired, true)
        end
      end
    end
  end

  def hired_bands
    @hired_bands ||= self.bandlists.filled.pluck(:band_id)
  end

end
