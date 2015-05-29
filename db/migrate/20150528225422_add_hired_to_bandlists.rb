class AddHiredToBandlists < ActiveRecord::Migration
  def change
    add_column :bandlists, :hired, :boolean
  end
end
