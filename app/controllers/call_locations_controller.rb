class CallLocationsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /call_locations
  # GET /call_locations.json
  def index
    @call_locations = CallLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @call_locations }
    end
  end

  # GET /call_locations/1
  # GET /call_locations/1.json
  def show
    @call_location = CallLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call_location }
    end
  end

  # GET /call_locations/new
  # GET /call_locations/new.json
  def new
    @call_location = CallLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call_location }
    end
  end

  # GET /call_locations/1/edit
  def edit
    @call_location = CallLocation.find(params[:id])
  end

  # POST /call_locations
  # POST /call_locations.json
  def create
    @call_location = CallLocation.new(params[:call_location])

    respond_to do |format|
      if @call_location.save
        format.html { redirect_to @call_location, notice: 'Call location was successfully created.' }
        format.json { render json: @call_location, status: :created, location: @call_location }
      else
        format.html { render action: "new" }
        format.json { render json: @call_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /call_locations/1
  # PUT /call_locations/1.json
  def update
    @call_location = CallLocation.find(params[:id])

    respond_to do |format|
      if @call_location.update_attributes(params[:call_location])
        format.html { redirect_to @call_location, notice: 'Call location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_locations/1
  # DELETE /call_locations/1.json
  def destroy
    @call_location = CallLocation.find(params[:id])
    @call_location.destroy

    respond_to do |format|
      format.html { redirect_to call_locations_url }
      format.json { head :no_content }
    end
  end
end
