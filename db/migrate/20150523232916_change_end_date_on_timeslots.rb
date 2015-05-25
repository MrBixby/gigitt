class ChangeEndDateOnTimeslots < ActiveRecord::Migration
  def change
    remove_column :timeslots, :end_time
    add_column :timeslots, :doors, :time
  end
end
