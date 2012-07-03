class AddColumnIsActiveToAims < ActiveRecord::Migration
  def change
    add_column :aims, :is_active, :boolean
  end
end
