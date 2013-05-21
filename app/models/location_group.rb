class LocationGroup < ActiveRecord::Base
  attr_accessible :name
  has_many :locations
end
