class AddCategoryIdToUnit < ActiveRecord::Migration
  def change
    add_column :units, :category_id, :integer
  end
end
