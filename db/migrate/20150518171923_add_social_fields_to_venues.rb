class AddSocialFieldsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :description, :text
    add_column :venues, :address, :string
    add_column :venues, :city, :string
    add_column :venues, :state, :string
    add_column :venues, :zip, :integer
    add_column :venues, :phone, :string
    add_column :venues, :email, :string
    add_column :venues, :twitter, :string
    add_column :venues, :facebook, :string
    add_column :venues, :instagram, :string
  end
end
