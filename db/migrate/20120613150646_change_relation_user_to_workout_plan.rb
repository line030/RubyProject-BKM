class ChangeRelationUserToWorkoutPlan < ActiveRecord::Migration
  def change
    drop_table :users_workout_plans
    add_column :workout_plans, :user_id, :integer
  end
end
