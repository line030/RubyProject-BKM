class AddUserIdToWorkoutSession < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :user_id, :integer
  end
end
