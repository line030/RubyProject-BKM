class AddPolymorphicTablePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :value
      t.references :awardable, :polymorphic => true
      t.timestamps
    end
  end
end
