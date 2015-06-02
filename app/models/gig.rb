class Gig < ActiveRecord::Base

  has_many :bandlists
  has_many :bands, through: :bandlists
  has_many :hired_bandlists, -> { filled }, class_name: Bandlist
  belongs_to :venue

  accepts_nested_attributes_for :bandlists

  validates :description, presence: true, length: { minimum: 8 }
  validates :event, presence: true, length: { maximum: 20 }
  validates :age, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :showtime, presence: true
  validates :doors, presence: true

  scope :upcoming, -> {where('date >= ?', Time.zone.today).order(date: :desc)}
  scope :pending, -> {where('is_final = ?', false)}
  scope :finalized, -> {where('is_final = ?', true)}
  scope :past, -> {where('date <= ?', 1.day.ago).order(date: :desc)}
  scope :present, -> {where('date >= ? AND date <= ?', Time.zone.today, 1.week.from_now,).order(:date)}
  scope :future, -> {where('date >= ?', 1.week.from_now).order(:date)}

  before_save :hire_bandlists

  def band_options
    b = self.bands.pluck("name", "id")
    if b.empty?
      return ["No Bands Available"]
    end
    return b
  end

  def hire_bandlists
    hired_bandlists.reject(&:empty?).each do |hired_bandlist|
      hired_bandlist.update_attribute(:hired, true)
    end
  end

end
