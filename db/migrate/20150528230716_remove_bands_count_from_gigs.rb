class RemoveBandsCountFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :bands_count, :integer
  end
end
