class ChangeTheDamnNameOfDateInAimProgress < ActiveRecord::Migration
  def change
    rename_column :aim_progresses, :date, :logging_date
  end
end
