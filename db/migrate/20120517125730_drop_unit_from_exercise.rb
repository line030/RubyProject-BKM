class DropUnitFromExercise < ActiveRecord::Migration
  def change
    remove_column :exercises, :unit
  end
end