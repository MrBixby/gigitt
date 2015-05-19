class AddUserIdToFans < ActiveRecord::Migration
  def change
    add_column :fans, :user_id, :integer
  end
end
