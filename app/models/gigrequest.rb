class Gigrequest < ActiveRecord::Base
  belongs_to :band
  belongs_to :timeslot
end
