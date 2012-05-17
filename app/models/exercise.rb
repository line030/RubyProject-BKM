class Exercise < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :workout_days
end
