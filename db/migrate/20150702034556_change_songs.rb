class ChangeSongs < ActiveRecord::Migration
  change_table :songs do |t|
    t.remove :album, :band_id
    t.integer :album_id, index: true, foreign_key: true
    t.integer :track
  end
end
