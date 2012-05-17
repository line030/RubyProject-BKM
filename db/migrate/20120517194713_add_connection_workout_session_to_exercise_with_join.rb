class AddConnectionWorkoutSessionToExerciseWithJoin < ActiveRecord::Migration
  def change
    create_table :exercises_workout_thrills, :id => false do |t|
      t.integer :exercise_id
      t.integer :workout_thrill_id
      t.integer :value
      t.integer :multiplier
    end
  end
end
