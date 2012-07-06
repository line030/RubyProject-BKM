class WorkoutSession < ActiveRecord::Base
  has_many :exercises_workout_thrills, :dependent => :delete_all
  has_many :exercises, :through => :exercises_workout_thrills
  belongs_to :workout_day
  belongs_to :user
end
