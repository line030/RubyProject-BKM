class AddColumnIsActiveToWorkouPlans < ActiveRecord::Migration
  def change
    add_column :workout_plans, :isActive, :boolean
  end
end
