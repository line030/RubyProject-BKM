class AddWorkoutDaysExercisesJoinTable < ActiveRecord::Migration
  def up
    create_table :exercises_workout_days, :id => false do |t|
      t.integer :exercise_id
      t.integer :workout_day
    end
  end

  def down
    drop_table :exercises_workout_days
  end
end
