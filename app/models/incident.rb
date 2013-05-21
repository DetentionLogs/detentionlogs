class Incident < ActiveRecord::Base
  attr_accessible :incident_number, :incident_type, :level, :location_id,  :location_details, :occured_on, :summary, :detailed_report
  has_attached_file :detailed_report
  belongs_to :location
  
  scope :by_incident_type, lambda { |incident_type| where(:incident_type => incident_type) unless incident_type.blank? }
  scope :by_location, lambda { |location| where(:location => location) unless location.blank? }
end
