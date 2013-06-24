FactoryGirl.define do

  factory :incident do
    incident_number "1-XXXXX"
  end

  factory :foi_request do
    url_title "foi_request_for_122"
    described_state "nearly_done"
    display_status "Nearly Done!"
  end

end
