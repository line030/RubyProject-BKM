class CreateWorkoutDays < ActiveRecord::Migration
  def change
    create_table :workout_days do |t|
      t.string :day

      t.timestamps
    end
  end
end
