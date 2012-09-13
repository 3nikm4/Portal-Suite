class DeviceProblemStatusesController < ApplicationController
  load_and_authorize_resource

  # GET /device_problem_statuses
  # GET /device_problem_statuses.json
  def index
    @device_problem_statuses = DeviceProblemStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_problem_statuses }
    end
  end

  # GET /device_problem_statuses/1
  # GET /device_problem_statuses/1.json
  def show
    @device_problem_status = DeviceProblemStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_problem_status }
    end
  end

  # GET /device_problem_statuses/new
  # GET /device_problem_statuses/new.json
  def new
    @device_problem_status = DeviceProblemStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_problem_status }
    end
  end

  # GET /device_problem_statuses/1/edit
  def edit
    @device_problem_status = DeviceProblemStatus.find(params[:id])
  end

  # POST /device_problem_statuses
  # POST /device_problem_statuses.json
  def create
    @device_problem_status = DeviceProblemStatus.new(params[:device_problem_status])

    respond_to do |format|
      if @device_problem_status.save
        format.html { redirect_to @device_problem_status, notice: 'Device problem status was successfully created.' }
        format.json { render json: @device_problem_status, status: :created, location: @device_problem_status }
      else
        format.html { render action: "new" }
        format.json { render json: @device_problem_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_problem_statuses/1
  # PUT /device_problem_statuses/1.json
  def update
    @device_problem_status = DeviceProblemStatus.find(params[:id])

    respond_to do |format|
      if @device_problem_status.update_attributes(params[:device_problem_status])
        format.html { redirect_to @device_problem_status, notice: 'Device problem status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_problem_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_problem_statuses/1
  # DELETE /device_problem_statuses/1.json
  def destroy
    @device_problem_status = DeviceProblemStatus.find(params[:id])
    @device_problem_status.destroy

    respond_to do |format|
      format.html { redirect_to device_problem_statuses_url }
      format.json { head :ok }
    end
  end
end
