class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :release_year
      t.text :comment
      t.string :image_url

      t.timestamps null: false
    end
  end
end
