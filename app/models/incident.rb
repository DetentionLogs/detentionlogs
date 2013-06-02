class Incident < ActiveRecord::Base
  attr_accessible :incident_number, :incident_type, :level, :location_id,  :location_details, :occured_on, :summary, :detailed_report
  has_attached_file :detailed_report
  belongs_to :location
  
  scope :by_incident_type, lambda { |incident_type| where(:incident_type => incident_type) unless incident_type.blank? }
  scope :by_location, lambda { |location| where(:location => location) unless location.blank? }
  scope :by_period, lambda { |start_on, end_on|
    start_on = default_period_range.first unless start_on.present?
    end_on = default_period_range.end unless end_on.present?
    where(:occured_on => (start_on.to_date)..(end_on.to_date))
  }
  scope :by_detailed_report, -> { where('detailed_report_file_name is not null')  }

  def self.default_period_range
    # TODO: pull from db
    ('2009-10-03'.to_date)..('2011-05-26'.to_date)
  end
end
