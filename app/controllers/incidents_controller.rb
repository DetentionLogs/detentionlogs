class IncidentsController < ApplicationController
 
   
  # GET /incidents
  # GET /incidents.json
  def index
    if(params[:date_first])
      @date_first = Date.parse(params[:date_first])
    else
      @date_first = Date.parse("2010-08-25")
      params[:date_first] = @date_first
    end
    if(params[:date_second])
      @date_second = Date.parse(params[:date_second])
    else
      @date_second = Date.parse("2011-04-25")
      params[:date_second] = @date_second
    end
    
    if params[:location]
      @locations = params[:location].split(',')
      @incident_type = params[:incident].split(',')
      @level = params[:level].split(',')
      @incidents = Incident.where("occured_on in (?) AND location in (?) AND incident_type in (?) AND level in (?)", @date_first..@date_second, @locations, @incident_type, @level).page(params[:page])
    else
      @incidents = Incident.where("occured_on in (?)", @date_first..@date_second).page(params[:page])
    end
    


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidents }
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    @incident = Incident.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident }
    end
  end

  # GET /incidents/new
  # GET /incidents/new.json
  def new
    @incident = Incident.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident }
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
end
