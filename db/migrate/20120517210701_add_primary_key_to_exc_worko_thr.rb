class AddPrimaryKeyToExcWorkoThr < ActiveRecord::Migration
  def change
    drop_table :exercises_workout_thrills

    create_table :exercises_workout_thrills do |t|
      t.integer :exercise_id
      t.integer :workout_thrill_id
      t.integer :value
      t.integer :multiplier
    end
  end
end
