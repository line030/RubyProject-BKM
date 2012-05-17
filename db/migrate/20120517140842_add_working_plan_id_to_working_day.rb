class AddWorkingPlanIdToWorkingDay < ActiveRecord::Migration
  def change
    add_column :workout_days, :working_plan_id, :integer
  end
end
