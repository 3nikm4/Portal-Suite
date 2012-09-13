class DeviceBatteriesController < ApplicationController
  # GET /device_batteries
  # GET /device_batteries.json
  def index
    @device_batteries = DeviceBattery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_batteries }
    end
  end

  # GET /device_batteries/1
  # GET /device_batteries/1.json
  def show
    @device_battery = DeviceBattery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_battery }
    end
  end

  # GET /device_batteries/new
  # GET /device_batteries/new.json
  def new
    @device_battery = DeviceBattery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_battery }
    end
  end

  # GET /device_batteries/1/edit
  def edit
    @device_battery = DeviceBattery.find(params[:id])
  end

  # POST /device_batteries
  # POST /device_batteries.json
  def create
    @device_battery = DeviceBattery.new(params[:device_battery])

    respond_to do |format|
      if @device_battery.save
        format.html { redirect_to @device_battery, notice: 'Device battery was successfully created.' }
        format.json { render json: @device_battery, status: :created, location: @device_battery }
      else
        format.html { render action: "new" }
        format.json { render json: @device_battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_batteries/1
  # PUT /device_batteries/1.json
  def update
    @device_battery = DeviceBattery.find(params[:id])

    respond_to do |format|
      if @device_battery.update_attributes(params[:device_battery])
        format.html { redirect_to @device_battery, notice: 'Device battery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_batteries/1
  # DELETE /device_batteries/1.json
  def destroy
    @device_battery = DeviceBattery.find(params[:id])
    @device_battery.destroy

    respond_to do |format|
      format.html { redirect_to device_batteries_url }
      format.json { head :ok }
    end
  end
end
