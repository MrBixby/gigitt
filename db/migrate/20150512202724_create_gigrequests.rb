class CreateGigrequests < ActiveRecord::Migration
  def change
    create_table :gigrequests do |t|
      t.integer :band_id
      t.integer :timeslot_id

      t.timestamps null: false
    end
  end
end
