class AddBandToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :band, :string
  end
end
