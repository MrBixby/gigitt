class ChangeHiredColumnOnBandlist < ActiveRecord::Migration
  def change
    change_column_null :bandlists, :hired, false
    change_column_default :bandlists, :hired, false
  end
end
