class AddColumnIsGlobalToWorkoutDay < ActiveRecord::Migration
  def change
    add_column :workout_days, :is_global, :boolean, :default => false, :null => false
  end
end
