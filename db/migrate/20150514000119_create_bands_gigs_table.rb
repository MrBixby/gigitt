class CreateBandsGigsTable < ActiveRecord::Migration
  def change
    create_table :bands_gigs do |t|
      t.integer :band_id
      t.integer :gig_id
    end
  end
end
