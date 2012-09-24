class AddDateToAimProgress < ActiveRecord::Migration
  def change
      add_column :aim_progresses, :date, :datetime
  end
end

