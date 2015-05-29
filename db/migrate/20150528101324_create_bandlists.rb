class CreateBandlists < ActiveRecord::Migration
  def change
    drop_table :bands_gigs
    create_table :bandlists do |t|
      t.references :band, index: true, foreign_key: true
      t.references :gig, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
