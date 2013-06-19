require "spec_helper"
require File.expand_path('../../../lib/api/right_to_know', __FILE__)

describe Api::RightToKnow do

  context ".update!" do

    let!(:incident_number){ '1-48686B' }
    let!(:incident){ FactoryGirl.create(:incident, :incident_number => incident_number) }

    before do
      setup_right_to_know_site_stubs
    end

    context "with no existing FOI data associated with the incident" do

      it "should create the FOI Request using the json data" do
        Api::RightToKnow.update!
        incident.foi_requests.count.should == 2
        foi_request = incident.foi_requests.detect{|request|
          request.url_title == "foi_request_for_detail_incident_92"
        }
        foi_request.described_state.should == "waiting_response"
        foi_request.display_status.should == "Awaiting response."
        foi_request.created_at.to_date.should == Date.new(2013, 6, 15)
        foi_request.updated_at.to_date.should == Date.new(2013, 6, 17)
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
        foi_request = incident.foi_requests.detect{|request|
          request.url_title == "foi_request_for_detail_incident_99"
        }
        foi_request.described_state.should == "waiting_response"
        foi_request.display_status.should == "Awaiting response."
        foi_request.created_at.to_date.should == Date.new(2013, 6, 16)
        foi_request.updated_at.to_date.should == Date.new(2013, 6, 18)
      end

    end

  end

  protected

  def setup_right_to_know_site_stubs
    responses = [
      'Results_page_1_-_Right_To_Know.html',
      'foi_request_for_detail_incident_92.json',
      'Results_page_2_-_Right_To_Know.html',
      'foi_request_for_detail_incident_99.json'
    ].map{|fileName|
      File
        .open(File.expand_path('../../fixtures/' + fileName, __FILE__), "r") 
        .read()
    }
    RestClient.stub!(:get).and_return(*responses)
  end

end
