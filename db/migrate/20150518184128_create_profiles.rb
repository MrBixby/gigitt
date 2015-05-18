class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.integer :zip
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
