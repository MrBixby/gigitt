class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :openings
      t.integer :pay_amount
      t.boolean :paid_gig
      t.string :notes
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
