class AddUserIdToAims < ActiveRecord::Migration
  def change
    add_column :aims, :user_id, :integer
  end
end
