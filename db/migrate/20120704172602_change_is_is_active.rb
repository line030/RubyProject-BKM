class ChangeIsIsActive < ActiveRecord::Migration
  def change
    rename_column :aims, :is_is_active, :is_active
  end
end
