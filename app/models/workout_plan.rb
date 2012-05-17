class WorkoutPlan < ActiveRecord::Base
    has_many :workout_days
end
