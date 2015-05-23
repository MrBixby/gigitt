class Timeslot < ActiveRecord::Base
  belongs_to :venue
  has_many :gigrequests, dependent: :destroy
  has_one :gig, dependent: :destroy

  accepts_nested_attributes_for :gig, update_only: true

  validates :date, presence: true

  validates :start_time, presence: true

  validates :end_time, presence: true

  scope :upcoming, -> {where('date >= ?', Date.today)}
  scope :pending, -> {where.not(id: Gig.select(:timeslot_id))}
  scope :past, -> {where('date <= ?', 1.week.ago)}
  scope :present, -> {where('date >= ? AND date <= ?', 1.week.ago, 1.week.from_now)}
  scope :future, -> {where('date <= ?', 1.week.from_now)}
end
