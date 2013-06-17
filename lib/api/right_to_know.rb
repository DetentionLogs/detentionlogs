require 'rest_client'

module Api 
  module RightToKnow
    
    mattr_writer :endpoint
    self.endpoint = 'https://www.righttoknow.org.au/feed/search/(tag:detentionlogs).json'

    def self.update!
      response = RestClient.get @@endpoint, {accept: :json}
      json = JSON.parse(response)
      json.each do |foi|
        foi_info = foi['info_request']
        id = extract_id_from_tags foi_info
        Rails.logger.info "Extracted incident number: #{id} from FOI request"
        incident = Incident.find_by_incident_number(id)
        if !incident
          Rails.logger.warn "Unable to find incident using #{id}" unless incident
        else
          foi_data = foi_info.slice(
            'url_title', 'display_status', 'described_state', 'created_at', 'updated_at'
          )
          foi_request = incident.foi_requests
            .where(url_title: foi_info['url_title'])
            .first_or_initialize
          foi_request.update_attributes!(foi_data)
        end
      end
    end

    protected

    def self.extract_id_from_tags(foi_info)
      tags = foi_info['tags']
      tag = tags.detect{|t| t.first == 'incident-number' }
      tag && tag.second.strip
    end

  end
end
