class AddColumnIsGlobalToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :is_global, :boolean, :default => false, :null => false
  end
end
