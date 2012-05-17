class ChangeWorkoutSessionJoinValueDatatype < ActiveRecord::Migration
  def change
    change_column :exercises_workout_thrills, :value, :decimal, :precision => 8, :scale => 2, :null => false
  end
end
