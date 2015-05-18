class AddSocialFieldsToBands < ActiveRecord::Migration
  def change
    add_column :bands, :genre, :string
    add_column :bands, :description, :text
    add_column :bands, :city, :string
    add_column :bands, :zip, :integer
    add_column :bands, :twitter, :string
    add_column :bands, :instagram, :string
    add_column :bands, :facebook, :string
    add_column :bands, :soundcloud, :string
    add_column :bands, :last_fm, :string
  end
end
