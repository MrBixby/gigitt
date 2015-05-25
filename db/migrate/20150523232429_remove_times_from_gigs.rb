class RemoveTimesFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :doors, :time
    remove_column :gigs, :showtime, :time
  end
end
