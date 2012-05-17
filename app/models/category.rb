class Category < ActiveRecord::Base
  has_many :aims
  belongs_to :unit
end
