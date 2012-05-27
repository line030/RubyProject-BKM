class WorkoutPlan < ActiveRecord::Base
    has_many :workout_days
    has_and_belongs_to_many :users

end
