class ChangeColumnNamingIsActive < ActiveRecord::Migration
  def change
    remove_column :workout_plans, :isActive
    add_column :workout_plans, :is_active, :boolean
  end
end
