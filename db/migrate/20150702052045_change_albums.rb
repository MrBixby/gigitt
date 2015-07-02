class ChangeAlbums < ActiveRecord::Migration
  change_table :albums do |t|
    t.remove :release_year
    t.date :release_year
  end
end
