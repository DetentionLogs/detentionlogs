class Incident < ActiveRecord::Base
  attr_accessible :incidenttype, :location, :name, :occurence_date
end
