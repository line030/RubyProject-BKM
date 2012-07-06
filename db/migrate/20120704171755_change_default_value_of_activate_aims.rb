class ChangeDefaultValueOfActivateAims < ActiveRecord::Migration

  remove_column :aims, :is_active
  add_column :aims, :is_is_active , :boolean ,:default => false

end
