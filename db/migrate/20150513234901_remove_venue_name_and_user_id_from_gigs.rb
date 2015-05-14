class RemoveVenueNameAndUserIdFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :venue_name, :string
    remove_column :gigs, :user_id, :integer
  end
end
