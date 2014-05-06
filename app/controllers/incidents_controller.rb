# Controller for Incident Reports
class IncidentsController < ApplicationController
  before_filter :authenticate_admin!, except: [
    :index,
    :show,
    :adopt,
    :show_by_incident_number,
    :adopt_by_incident_number,
    :foi_summary,
    :about
  ]

  has_scope :by_incident_type, :as => :incident_type
  has_scope :by_location, :as => :location
  has_scope :by_period, :using => [:start_date, :end_date]
  has_scope :by_detailed_report, :type => :boolean

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents =  apply_scopes(Incident).order("occured_on").page(params[:page]).per(50)
    @location_groups = LocationGroup.all

    if params[:location] && params[:location] > ""
      location = Location.find(params[:location])
      @location_name = location.name
    end

    @start_date = params[:by_period].try(:[], :start_date).try(:to_date) ||
      Incident.default_period_range.first
    @end_date = params[:by_period].try(:[], :end_date).try(:to_date) ||
      Incident.default_period_range.end
    @incident_types = Incident.uniq.pluck(:incident_type)
    logger.debug @incident_types
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidents }
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    begin
      @incident = Incident.find(params[:id])
    rescue
      logger.error "Attempt to access unknown incident report #{params[:id]}"
      redirect_to incidents_url, notice: 'Sorry, invalid Incident ID'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @incident }
      end
    end
  end

  def adopt
    @incident = Incident.find(params[:incident_id])

    respond_to do |format|
      format.html # adopt.html.erb
      format.json { render json: @incident }
    end
  end


  def show_by_incident_number
    @incident = Incident.where(["incident_number = ?", params[:incident_number]]).first
    redirect_to(@incident)
  end

  def adopt_by_incident_number
    @incident = Incident.where(["incident_number = ?", params[:incident_number]]).first
    redirect_to(incident_adopt_path(@incident))
  end

  # GET /incidents/new
  # GET /incidents/new.json
  def new
  #  @incident = Incident.new
  #
  #  respond_to do |format|
   #   format.html # new.html.erb
  #    format.json { render json: @incident }
  #  end
  end

  def foi_summary
     @incidents = Incident.foi_summary
     respond_to do |format|
       format.html {}
       format.json { render json: @incidents }
     end
  end

  # GET /incidents/1/edit
  def edit
    @incident = Incident.find(params[:id])
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(params[:incident])

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render json: @incident, status: :created, location: @incident }
      else
        format.html { render action: "new" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incidents/1
  # PUT /incidents/1.json
  def update
    @incident = Incident.find(params[:id])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  def deletereport
    @incident = Incident.find(params[:incident_id])

    @incident.detailed_report = nil
    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy

    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  def about

  end
end
