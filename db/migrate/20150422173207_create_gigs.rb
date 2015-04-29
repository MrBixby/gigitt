class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :venue_name
      t.string :event
      t.date :date
      t.time :doors
      t.time :showtime
      t.string :age
      t.string :price
      t.text :description

      t.timestamps null: false
    end
  end
end
