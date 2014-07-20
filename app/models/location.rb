class Location < ActiveRecord::Base
  attr_accessible :geoloc, :name, :description, :location_group_id, :incidents_count

  # attr_readonly(:incidents_count)

  has_many :incidents
    -> { order "occured_on"}

  belongs_to :location_group
end
