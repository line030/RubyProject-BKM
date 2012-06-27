class ChangeForeignKeyUserAddress < ActiveRecord::Migration
  def change
    remove_column :users, :address_id, :integer
    add_column :addresses, :user_id, :integer
  end
end
