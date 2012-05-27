class JoinTableUsersAndWPlans < ActiveRecord::Migration
  def change
    create_table :users_workout_plans,
                 :id => false do |t|
      t.integer :user_id
      t.integer :workout_plan_id
    end
  end
end