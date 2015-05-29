class DropGigrequests < ActiveRecord::Migration
  def change
    drop_table :gigrequests
  end
end
