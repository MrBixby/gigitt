class RemoveTimeslotIdFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :timeslot_id, :integer
  end
end
