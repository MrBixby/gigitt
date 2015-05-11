class Band < ActiveRecord::Base

  has_many :gigs
  has_many :fans
end
