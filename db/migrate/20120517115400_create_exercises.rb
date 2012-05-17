class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :points
      t.string :unit

      t.timestamps
    end
  end
end
