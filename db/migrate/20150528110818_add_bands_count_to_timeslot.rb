class AddBandsCountToTimeslot < ActiveRecord::Migration
  def change
    add_column :timeslots, :gb_count, :integer, default: 0
  end
end
