class Fan < ActiveRecord::Base

  has_many :bands
  belongs_to :user
end
