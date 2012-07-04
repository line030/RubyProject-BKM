class ChangeTheDamnNameOfDateInAimProgressAaaaaaaaaa < ActiveRecord::Migration
  def change
    remove_column :aim_progresses, :logging_date
    add_column :aim_progresses, :logging_date, :datetime

  end
end
