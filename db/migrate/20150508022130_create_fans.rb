class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
