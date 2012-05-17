class CreateAims < ActiveRecord::Migration
  def change
    create_table :aims do |t|
      t.string :value

      t.timestamps
    end
  end
end
