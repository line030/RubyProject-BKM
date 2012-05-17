class RenameWorkoutDaysJinTableColumn < ActiveRecord::Migration
  def change
    rename_column :exercises_workout_days, :workout_day, :workout_day_id
  end
end
