class Aim < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :aim_progresses
end
