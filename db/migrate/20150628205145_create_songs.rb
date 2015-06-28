class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album
      t.string :year
      t.text :comment
      t.string :genre
      t.integer :band_id
    end
    add_index :songs, :band_id
  end
end
