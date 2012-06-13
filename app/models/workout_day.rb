class WorkoutDay < ActiveRecord::Base
  has_many :tags, :as => :taggable
  has_and_belongs_to_many :exercises
  belongs_to :workout_plan
  belongs_to :user
  has_one :workout_session
end
