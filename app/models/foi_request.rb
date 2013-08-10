class FoiRequest < ActiveRecord::Base
  belongs_to :incident
  attr_accessible :described_state, :display_status, :url_title
  # Allow these to be set to match the external request
  attr_accessible :created_at, :updated_at

  validates_presence_of :url_title, :display_status, :described_state, :incident_id
  validates_uniqueness_of :url_title
end
