class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.integer :song_id
      t.integer :bandlist_id
    end
    add_index :setlists, :song_id
    add_index :setlists, :bandlist_id
  end
end
