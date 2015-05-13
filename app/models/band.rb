class Band < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :venues
  has_many :gigrequests, dependent: :destroy
  has_many :gigs
  has_many :fans

end
