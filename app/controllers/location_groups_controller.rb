class LocationGroupsController < ApplicationController
  # GET /location_groups
  # GET /location_groups.json
  def index
    @location_groups = LocationGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_groups }
    end
  end

  # GET /location_groups/1
  # GET /location_groups/1.json
  def show
    @location_group = LocationGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_group }
    end
  end

  # GET /location_groups/new
  # GET /location_groups/new.json
  def new
    @location_group = LocationGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_group }
    end
  end

  # GET /location_groups/1/edit
  def edit
    @location_group = LocationGroup.find(params[:id])
  end

  # POST /location_groups
  # POST /location_groups.json
  def create
    @location_group = LocationGroup.new(params[:location_group])

    respond_to do |format|
      if @location_group.save
        format.html { redirect_to @location_group, notice: 'Location group was successfully created.' }
        format.json { render json: @location_group, status: :created, location: @location_group }
      else
        format.html { render action: "new" }
        format.json { render json: @location_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_groups/1
  # PUT /location_groups/1.json
  def update
    @location_group = LocationGroup.find(params[:id])

    respond_to do |format|
      if @location_group.update_attributes(params[:location_group])
        format.html { redirect_to @location_group, notice: 'Location group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_groups/1
  # DELETE /location_groups/1.json
  def destroy
    @location_group = LocationGroup.find(params[:id])
    @location_group.destroy

    respond_to do |format|
      format.html { redirect_to location_groups_url }
      format.json { head :no_content }
    end
  end
end
