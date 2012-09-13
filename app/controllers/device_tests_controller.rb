class DeviceTestsController < ApplicationController
  # GET /device_tests
  # GET /device_tests.json
  def index
    @device_tests = DeviceTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_tests }
    end
  end

  # GET /device_tests/1
  # GET /device_tests/1.json
  def show
    @device_test = DeviceTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_test }
    end
  end

  # GET /device_tests/new
  # GET /device_tests/new.json
  def new
    @device_test = DeviceTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_test }
    end
  end

  # GET /device_tests/1/edit
  def edit
    @device_test = DeviceTest.find(params[:id])
  end

  # POST /device_tests
  # POST /device_tests.json
  def create
    @device_test = DeviceTest.new(params[:device_test])

    respond_to do |format|
      if @device_test.save
        format.html { redirect_to @device_test, notice: 'Device test was successfully created.' }
        format.json { render json: @device_test, status: :created, location: @device_test }
      else
        format.html { render action: "new" }
        format.json { render json: @device_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_tests/1
  # PUT /device_tests/1.json
  def update
    @device_test = DeviceTest.find(params[:id])

    respond_to do |format|
      if @device_test.update_attributes(params[:device_test])
        format.html { redirect_to @device_test, notice: 'Device test was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_tests/1
  # DELETE /device_tests/1.json
  def destroy
    @device_test = DeviceTest.find(params[:id])
    @device_test.destroy

    respond_to do |format|
      format.html { redirect_to device_tests_url }
      format.json { head :ok }
    end
  end
end
