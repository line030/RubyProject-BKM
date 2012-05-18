class RemoveNotNullFromexercisesWorkoutThrills < ActiveRecord::Migration
  def change
    remove_column :exercises_workout_thrills, :value
    add_column :exercises_workout_thrills, :value, :decimal, :precision => 8, :scale => 2

  end
end
