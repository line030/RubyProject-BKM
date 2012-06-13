class WorkoutPlan < ActiveRecord::Base
    has_many :tags, :as => :taggable
    has_many :workout_days
    belongs_to :user

end
