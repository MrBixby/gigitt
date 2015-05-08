class Band < ActiveRecord::Base

  has_many :gig
  has_many :fan
end
