require 'rest_client'
require 'nokogiri'

module Api 
  module RightToKnow
    
    mattr_writer :domain
    self.domain = 'https://www.righttoknow.org.au'

    mattr_writer :search_page
    self.search_page = '/search/tag:detentionlogs'

    def self.update!
      extract_requests(@@search_page)
    end

    protected

    def self.extract_requests(url)
      response = RestClient.get @@domain + url
      doc = Nokogiri::HTML(response)
      links = doc.css('.request_listing .head a')
      links.each do |link|
        update_request_from_json link['href']
        sleep(2)
      end
      next_link = doc.css('a.next_page').first
      if next_link
        extract_requests(next_link['href'])
      end
    end

    def self.update_request_from_json(url)
      json_url = @@domain + url.gsub(/#.*/, '') + '.json'
      response = RestClient.get json_url, {accept: :json}
      foi_info = JSON.parse response
      id = extract_id_from_tags foi_info
      if id.blank?
        Rails.logger.warn "Unable to extract id from tag #{foi_info}"
        return
      end
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

    def self.extract_id_from_tags(foi_info)
      tags = foi_info['tags']
      return unless tags
      tag = tags.detect{|t| t.first == 'incident-number' }
      tag && tag.second.strip
    end
  end
end
