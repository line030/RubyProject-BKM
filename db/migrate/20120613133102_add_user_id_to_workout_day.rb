class AddUserIdToWorkoutDay < ActiveRecord::Migration
  def change
    add_column :workout_days, :user_id, :integer
  end
end
