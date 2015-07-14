class Song < ActiveRecord::Base

  belongs_to :album
  has_many :bandlists, through: :setlist

end
