class DeviceStatusesController < ApplicationController
  load_and_authorize_resource

  # GET /device_statuses
  # GET /device_statuses.json
  def index
    @device_statuses = DeviceStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_statuses }
    end
  end

  # GET /device_statuses/1
  # GET /device_statuses/1.json
  def show
    @device_status = DeviceStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_status }
    end
  end

  # GET /device_statuses/new
  # GET /device_statuses/new.json
  def new
    @device_status = DeviceStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_status }
    end
  end

  # GET /device_statuses/1/edit
  def edit
    @device_status = DeviceStatus.find(params[:id])
  end

  # POST /device_statuses
  # POST /device_statuses.json
  def create
    @device_status = DeviceStatus.new(params[:device_status])

    respond_to do |format|
      if @device_status.save
        format.html { redirect_to @device_status, notice: 'Device status was successfully created.' }
        format.json { render json: @device_status, status: :created, location: @device_status }
      else
        format.html { render action: "new" }
        format.json { render json: @device_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_statuses/1
  # PUT /device_statuses/1.json
  def update
    @device_status = DeviceStatus.find(params[:id])

    respond_to do |format|
      if @device_status.update_attributes(params[:device_status])
        format.html { redirect_to @device_status, notice: 'Device status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_statuses/1
  # DELETE /device_statuses/1.json
  def destroy
    @device_status = DeviceStatus.find(params[:id])
    @device_status.destroy

    respond_to do |format|
      format.html { redirect_to device_statuses_url }
      format.json { head :ok }
    end
  end
end
