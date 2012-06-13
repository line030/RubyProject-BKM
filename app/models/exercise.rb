class Exercise < ActiveRecord::Base
  belongs_to :unit
  belongs_to :user
  has_and_belongs_to_many :workout_days
  has_many :exercises_workout_thrills
  has_many :workout_sessions, :through => :exercises_workout_thrills
end
