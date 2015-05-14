class RemoveDuplicatesFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :band, :string
    remove_column :gigs, :band_id, :integer
    remove_column :gigs, :date, :date
  end
end
