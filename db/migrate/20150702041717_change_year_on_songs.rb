class ChangeYearOnSongs < ActiveRecord::Migration
  change_table :songs do |t|
    t.remove :year
  end
end
