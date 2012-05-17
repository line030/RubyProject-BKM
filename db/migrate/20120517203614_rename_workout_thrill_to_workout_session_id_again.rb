class RenameWorkoutThrillToWorkoutSessionIdAgain < ActiveRecord::Migration
  def change
    rename_column :exercises_workout_thrills, :workout_thrill_id, :workout_session_id
  end
end
