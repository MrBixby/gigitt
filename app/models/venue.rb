class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :users
  has_many :timeslots, dependent: :destroy
end
