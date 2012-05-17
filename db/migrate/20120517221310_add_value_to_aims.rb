class AddValueToAims < ActiveRecord::Migration
  def change
    add_column :aims, :value, :integer
  end
end
