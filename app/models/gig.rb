class Gig < ActiveRecord::Base

  has_many :bandlists
  has_many :bands, through: :bandlists
  has_many :hired_bandlists, -> { filled }, class_name: Bandlist
  belongs_to :venue

  accepts_nested_attributes_for :bandlists
  attr_writer :hired_bands

  def hired_bands
    @hired_bands || self.hired_bandlists.map(&:band_id)
  end

  validates :description, presence: true, length: { minimum: 8 }
  validates :event, presence: true, length: { maximum: 20 }
  validates :age, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :showtime, presence: true
  validates :openings, presence: true
  validates :doors, presence: true

  scope :upcoming, -> {where('date >= ?', Time.zone.today).order(date: :desc)}
  scope :pending, -> {where('is_final = ?', false)}
  scope :finalized, -> {where('is_final = ?', true)}
  scope :past, -> {where('date <= ?', 1.day.ago).order(date: :desc)}
  scope :present, -> {where('date >= ? AND date <= ?', Time.zone.today, 1.week.from_now,).order(:date)}
  scope :future, -> {where('date >= ?', 1.week.from_now).order(:date)}

  before_update :unhire_bands
  after_update :hire_bands

  def band_options
    b = self.bands.pluck("name", "id")
    if b.empty?
      return ["No Bands Available"]
    end
    return b
  end

  def unhire_bands
    if hired_bands.present?
      current_bandlist = self.hired_bandlists.pluck(:band_id)
      fired_bands = current_bandlist - hired_bands
      fired_bands.each do |fb|
        band = self.bandlists.where('gig_id = ? AND band_id = ?', self.id, fb)
        band.each do |fired|
          fired.update_attribute(:hired, false)
        end
      end
    end
  end

  def hire_bands
    if hired_bands.present?
      hired_bands.reject(&:empty?).each do |hb|
        band = self.bandlists.where('gig_id = ? AND band_id = ?', self.id, hb)
        band.each do |hired|
          hired.update_attribute(:hired, true)
        end
      end
    end
  end

end
