class AddBandsUsers < ActiveRecord::Migration
  def change
     create_table :bands_users do |t|
          t.integer :band_id
          t.integer :user_id
     end
  end
end
