class Incident < ActiveRecord::Base
  attr_accessible :incident_number, :incident_type, :level, :location_details, :occured_on, :summary, :detailed_report
  has_attached_file :detailed_report
  belongs_to :location, counter_cache: true
  has_many :foi_requests

  scope :by_incident_type, lambda { |incident_type| where(:incident_type => incident_type) unless incident_type.blank? }
  scope :by_location, lambda { |location| where(:location_id => location) unless location.blank? }
  scope :by_period, lambda { |start_on, end_on|
    start_on = default_period_range.first unless start_on.present?
    end_on = default_period_range.end unless end_on.present?
    where(:occured_on => (start_on.to_date)..(end_on.to_date))
  }
  scope :by_detailed_report, -> { where('detailed_report_file_name is not null')  }

  class << self
    def default_period_range
      # TODO: pull from db
      ('2009-10-03'.to_date)..('2011-05-26'.to_date)
    end

    # Returns a summary of the FOI data for each incident. This should provide
    # enough info to know if an FOI request has already been made or if
    # detailed info has already been obtained
    def foi_summary
      columns = [arel_table[:incident_number], arel_table[:detailed_report_file_name], arel_table[:occured_on]]
      reqs = FoiRequest.arel_table
      req_count = Arel::Nodes::NamedFunction.new('string_agg', [reqs[:url_title], ','], 'requests')

      select([columns, req_count])
        .joins(Arel::Nodes::OuterJoin.new(reqs, Arel::Nodes::On.new(reqs[:incident_id].eq(arel_table[:id]))))
        .group(columns)
    end

    def first_occured
      order("occured_on").first.occured_on if order("occured_on").first
    end

    def last_occured
      order("occured_on").last.occured_on if order("occured_on").first
    end
  end
end
