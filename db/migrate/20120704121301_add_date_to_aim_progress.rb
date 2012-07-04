class AddDateToAimProgress < ActiveRecord::Migration
  def change
      add_column :aim_progresses, :date, :date_time
  end
end

