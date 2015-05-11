class AddGigIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gig_id, :string
  end
end
