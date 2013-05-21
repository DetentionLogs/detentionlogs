require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('aaa', 'bbb')
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get all" do
    get :all, :format => :json
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { incident_number: @incident.incident_number, incident_type: @incident.incident_type, level: @incident.level, location: @incident.location, location_details: @incident.location_details, occured_on: @incident.occured_on, summary: @incident.summary }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    put :update, id: @incident, incident: { incident_number: @incident.incident_number, incident_type: @incident.incident_type, level: @incident.level, location: @incident.location, location_details: @incident.location_details, occured_on: @incident.occured_on, summary: @incident.summary }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
