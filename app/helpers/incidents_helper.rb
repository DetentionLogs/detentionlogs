module IncidentsHelper

  # Creates a link to the Right To Know new request form. It populates the form
  # with incident specific details. It also populates the form with tags that
  # can later be used for tracking requests
  def link_to_right_to_know_form(incident, text=nil)
    url = "https://www.righttoknow.org.au/new/diac/?title=FOI%20Request%20for%20Detail%20Incident%20Report%20#{incident.incident_number};" + 
      "body=To%20the%20Department%20of%20Immigration%20and%20Citizenship%2C%0A%0ADear%20Sir%2FMadam" + 
      "%2C%0A%0AUnder%20the%20Freedom%20of%20Information%20Act%201982%20(Cth)%20I%20request%20the%20" +
      "following%20document%3A%0A%0AIncident%20Detail%20Report%20#{ incident.incident_number }%20" +
      "from%20the%20Department%27s%20Compliance%2C%20Case%20Management%2C%20Detention%20and%20" +
      "Settlement%20Portal.%20I%20also%20request%20any%20documents%20attached%20to%20the%20detailed" +
      "%20report.%0A%0AKind%20Regards%2C%0A%0A****ADD%20YOUR%20NAME%20HERE%20BEFORE%20SENDING%20REQUEST****" +
      "&tags=" + u("detentionlogs incident-number:#{incident.incident_number}")
    text ||= "Submit a public FOI request for Detail Incident Report #{incident.incident_number}"
    title =  "opens a prefilled Freedom of Information request using the Right To Know FOI tool"
    link_to text, url, { title: title }
  end

  # Creates a link to the Right To Know request
  def link_to_right_to_know(foi_request)
    link_to(
      "FOI Request: #{foi_request.display_status}", 
      "https://www.righttoknow.org.au/request/#{foi_request.url_title}",
      { class: "discrete distinct-download"}
    )
  end
end
