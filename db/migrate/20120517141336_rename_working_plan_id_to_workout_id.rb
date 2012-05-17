class RenameWorkingPlanIdToWorkoutId < ActiveRecord::Migration
  def change
    rename_column :workout_days, :working_plan_id, :workout_plan_id
  end
end
