class AddFinalFlagToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :is_final, :boolean
  end
end
