class Country < ActiveRecord::Base
  has_one :address
end
