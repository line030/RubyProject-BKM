class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  accepts_nested_attributes_for :user

  def name
    # setting the name for the admin view
    if (street.to_s.empty? && zip.to_s.empty?)
      @name = "id:" + id.to_s + ";Empty"
    else
      @name = "id:" + id.to_s + ";" + street.to_s + ";" + zip.to_s
    end
  end

  end

