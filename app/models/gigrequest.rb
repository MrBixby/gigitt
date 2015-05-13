class Gigrequest < ActiveRecord::Base
  belongs_to :band
  has_one :timeslot
end
