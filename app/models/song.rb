class Song < ActiveRecord::Base

  belongs_to :album
  has_many :bandlists, through: :setlist

  def songs_list
    song_list = []
  end

end
