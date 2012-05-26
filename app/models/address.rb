class Address < ActiveRecord::Base
  belongs_to :country
  has_one :user
end
