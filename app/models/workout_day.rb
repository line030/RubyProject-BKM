class WorkoutDay < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  belongs_to :workout_plan
  has_one :workout_session
end
