class DeviceCarriersController < ApplicationController
  # GET /device_carriers
  # GET /device_carriers.json
  def index
    @device_carriers = DeviceCarrier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_carriers }
    end
  end

  # GET /device_carriers/1
  # GET /device_carriers/1.json
  def show
    @device_carrier = DeviceCarrier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_carrier }
    end
  end

  # GET /device_carriers/new
  # GET /device_carriers/new.json
  def new
    @device_carrier = DeviceCarrier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_carrier }
    end
  end

  # GET /device_carriers/1/edit
  def edit
    @device_carrier = DeviceCarrier.find(params[:id])
  end

  # POST /device_carriers
  # POST /device_carriers.json
  def create
    @device_carrier = DeviceCarrier.new(params[:device_carrier])

    respond_to do |format|
      if @device_carrier.save
        format.html { redirect_to @device_carrier, notice: 'Device carrier was successfully created.' }
        format.json { render json: @device_carrier, status: :created, location: @device_carrier }
      else
        format.html { render action: "new" }
        format.json { render json: @device_carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_carriers/1
  # PUT /device_carriers/1.json
  def update
    @device_carrier = DeviceCarrier.find(params[:id])

    respond_to do |format|
      if @device_carrier.update_attributes(params[:device_carrier])
        format.html { redirect_to @device_carrier, notice: 'Device carrier was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_carriers/1
  # DELETE /device_carriers/1.json
  def destroy
    @device_carrier = DeviceCarrier.find(params[:id])
    @device_carrier.destroy

    respond_to do |format|
      format.html { redirect_to device_carriers_url }
      format.json { head :ok }
    end
  end
end
