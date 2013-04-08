class Incident < ActiveRecord::Base
  attr_accessible :incident_number, :incident_type, :level, :location, :location_details, :occured_on, :summary
end
