require "spec_helper"
require File.expand_path('../../../lib/api/right_to_know', __FILE__)

describe Api::RightToKnow do

  context ".update!" do

    let!(:incident_number){ '1-4VNA03' }
    let!(:incident){ FactoryGirl.create(:incident, :incident_number => incident_number) }
    let!(:response){ response_for_incident(incident_number) }

    before do
      RestClient.stub!(:get).and_return(response)
      Incident.stub!(:find_by_incident_number)
        .with(incident_number)
        .and_return(incident)
    end

    it "should request data from the API endpoint" do
      RestClient.should_receive(:get)
      Api::RightToKnow.update!
    end

    context "with no existing FOI data associated with the incident" do

      it "should create the FOI Request using the json data" do
        Api::RightToKnow.update!
        incident.foi_requests.count.should == 1
        foi_request = incident.foi_requests.first
        foi_request.url_title.should == "foi_request_for_detail_incident_92"
        foi_request.described_state.should == "waiting_response"
        foi_request.display_status.should == "Awaiting response."
        foi_request.created_at.to_date.should == Date.new(2013, 6, 15)
        foi_request.updated_at.to_date.should == Date.new(2013, 6, 15)
      end

    end

    context "with existing FOI data associated with the incident" do

      let!(:existing_foi_request){ 
        FoiRequest.destroy_all
        FactoryGirl.create(:foi_request, :incident_id => incident.id)
      }

      it "should update the FOI Request" do
        Api::RightToKnow.update!
        existing_foi_request.reload
        foi_request = incident.foi_requests.first
        foi_request.url_title.should == "foi_request_for_detail_incident_92"
        foi_request.described_state.should == "waiting_response"
        foi_request.display_status.should == "Awaiting response."
        foi_request.created_at.to_date.should == Date.new(2013, 6, 15)
        foi_request.updated_at.to_date.should == Date.new(2013, 6, 15)
      end

    end

    protected

    def response_for_incident(incident_number)
      <<-EOF
[
    {
        "calculated_state": "waiting_response", 
        "comment_id": null, 
        "created_at": "2013/06/18 10:18:19 +1000", 
        "described_state": "waiting_response", 
        "display_status": "Clarification", 
        "event_type": "sent", 
        "id": 1182, 
        "incoming_message_id": null, 
        "info_request": {
            "awaiting_description": false, 
            "created_at": "2013/06/15 10:18:18 +1000", 
            "described_state": "waiting_response", 
            "display_status": "Awaiting response.", 
            "id": 224, 
            "law_used": "foi", 
            "prominence": "normal", 
            "tags": [
                [
                    "incident-number", 
                    "#{incident.incident_number}"
                ], 
                [
                    "detentionlogs", 
                    null
                ]
            ], 
            "title": "FOI Request for Detail Incident Report 1-48686B", 
            "updated_at": "2013/06/15 10:18:19 +1000", 
            "url_title": "foi_request_for_detail_incident_92"
        }, 
        "last_described_at": "2013/06/18 10:18:19 +1000", 
        "outgoing_message_id": 456, 
        "public_body": {
            "created_at": "2012/10/15 19:41:00 +1100", 
            "home_page": "http://www.immi.gov.au", 
            "id": 786, 
            "name": "Department of Immigration and Citizenship", 
            "notes": "", 
            "publication_scheme": "http://www.immi.gov.au/about/foi/info-publication-scheme.htm", 
            "short_name": "DIAC", 
            "tags": [
                [
                    "immigration_&_citizenship", 
                    null
                ], 
                [
                    "oaic_report_2011_2012", 
                    null
                ], 
                [
                    "directory_gov_au", 
                    null
                ], 
                [
                    "foi_yes", 
                    null
                ]
            ], 
            "updated_at": "2013/06/06 23:36:01 +1000", 
            "url_name": "diac"
        }, 
        "snippet": "To the Department of Immigration and Citizenship,..", 
        "user": {
            "about_me": "", 
            "ban_text": "", 
            "id": 242, 
            "name": "B.J. Rossiter", 
            "url_name": "bj_rossiter"
        }
    }
]
EOF
    end
  end
end
