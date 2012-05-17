class AddCategoryIdToAim < ActiveRecord::Migration
  def change
    add_column :aims, :category_id, :integer
  end
end
