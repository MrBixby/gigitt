class AddTimeslotFieldsToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :date, :date
    add_column :gigs, :showtime, :time
    add_column :gigs, :doors, :time
    add_column :gigs, :openings, :integer
    add_column :gigs, :pay_amount, :decimal, precision: 5, scale: 2
    add_column :gigs, :paid_gig, :boolean
    add_column :gigs, :notes, :string
    add_reference :gigs, :venue, index: true, foreign_key: true
  end
end
