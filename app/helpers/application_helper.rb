module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def description(page_description)
    content_for :description, page_description.to_s
  end

  def incidentexplorer_results
      type_of_incident = 'incident report'
      if params[:incident_type]
        type_of_incident = "#{params[:incident_type]} #{type_of_incident}"
      end
      title = pluralize(@incidents.total_count, type_of_incident)
      title += " from #{@location_name}" if @location_name
      title += " between "
      title += [@start_date, @end_date].map{|d| d.strftime("%e %b %Y") }.to_sentence
  end

end
