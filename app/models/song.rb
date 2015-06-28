class Song < ActiveRecord::Base

  belong_to :band
  has_many :bandlists, through: :setlist

  def songs_list
    song_list = []
  end

end
