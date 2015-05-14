class AddTimeslotIdToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :timeslot_id, :integer
  end
end
