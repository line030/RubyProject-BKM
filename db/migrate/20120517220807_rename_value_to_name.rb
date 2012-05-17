class RenameValueToName < ActiveRecord::Migration
  def change
    rename_column :aims, :value, :name
  end
end
