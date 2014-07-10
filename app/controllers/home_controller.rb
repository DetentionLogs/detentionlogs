# Controller for the home page
class HomeController < ApplicationController
  before_filter :authenticate_admin!, except: [:frontpage]

  def frontpage
    @incident_count = Incident.count
    @incident_start_date = Incident.order("occured_on").first
    @incident_end_date = Incident.order("occured_on").last
  end
end
