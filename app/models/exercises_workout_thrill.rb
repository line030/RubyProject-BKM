class ExercisesWorkoutThrill < ActiveRecord::Base
  belongs_to :workout_session
  belongs_to :exercise

  has_many :points, :as => :awardable
end