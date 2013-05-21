class Location < ActiveRecord::Base
  attr_accessible :geoloc, :name, :description, :location_group_id
  has_many :incidents
  belongs_to :location_group
end
