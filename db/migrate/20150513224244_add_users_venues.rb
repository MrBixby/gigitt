class AddUsersVenues < ActiveRecord::Migration
  def change
     create_table :users_venues do |t|
          t.integer :user_id
          t.integer :venue_id
     end
  end
end
