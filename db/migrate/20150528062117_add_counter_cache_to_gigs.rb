class AddCounterCacheToGigs < ActiveRecord::Migration
  def self.up
    add_column :gigs, :bands_count, :integer, null:false, default: 0
  end
  def self.down
    remove_column :gigs, :bands_count
  end
end
