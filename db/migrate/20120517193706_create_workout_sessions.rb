class CreateWorkoutSessions < ActiveRecord::Migration
  def change
    create_table :workout_sessions do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
