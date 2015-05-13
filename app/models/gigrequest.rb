class Gigrequest < ActiveRecord::Base
  belongs_to :band
  has_many :timeslot
end
