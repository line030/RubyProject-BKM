class Unit < ActiveRecord::Base
  has_one :exercise
  has_many :categories
end
