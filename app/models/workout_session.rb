class WorkoutSession < ActiveRecord::Base
  has_many :exercises_workout_thrills
  has_many :exercises, :through => :exercises_workout_thrills
  belongs_to :workout_day
end
