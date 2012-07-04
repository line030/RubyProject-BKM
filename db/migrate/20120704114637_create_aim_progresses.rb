class CreateAimProgresses < ActiveRecord::Migration
  def change
    create_table :aim_progresses do |t|
      t.integer :value
      t.integer :aim_id

      t.timestamps
    end
  end
end
