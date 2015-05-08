class AddUserIdToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :user_id, :integer
    add_index :gigs, :user_id
  end
end
