class AddBandsFans < ActiveRecord::Migration
  def change
     create_table :bands_fans do |t|
          t.integer :band_id
          t.integer :fan_id
     end
  end
end
