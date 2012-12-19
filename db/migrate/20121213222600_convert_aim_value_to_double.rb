class ConvertAimValueToDouble < ActiveRecord::Migration
  def change
    change_column :aim_progresses, :value, :decimal, :precision => 8, :scale => 1, :null => false
    change_column :aims, :value, :decimal, :precision => 8, :scale => 1, :null => false
  end
end
