class AddCategoryIdFromUnit < ActiveRecord::Migration
  def change
    remove_column :units, :category_id
  end
end
