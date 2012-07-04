class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :awardable, :polymorphic => true
end