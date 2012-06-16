class AddColumnIsGlobalToWorkoutPlans < ActiveRecord::Migration
  def change
    add_column :workout_plans, :is_global, :boolean, :default => false, :null => false
  end
end
