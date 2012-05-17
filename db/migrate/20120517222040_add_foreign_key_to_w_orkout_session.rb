class AddForeignKeyToWOrkoutSession < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :workout_day_id, :integer
  end
end
