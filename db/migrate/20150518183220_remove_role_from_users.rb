class RemoveRoleFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string
    remove_column :users, :gig_id, :string
    remove_column :users, :profile, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zipcode, :string
  end
end
