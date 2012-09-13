class DeviceProblemsController < ApplicationController
  load_and_authorize_resource

  # GET /device_problems
  # GET /device_problems.json
  def index
    @device_problems = DeviceProblem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_problems }
    end
  end

  # GET /device_problems/1
  # GET /device_problems/1.json
  def show
    @device_problem = DeviceProblem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_problem }
    end
  end

  # GET /device_problems/new
  # GET /device_problems/new.json
  def new
    @device_problem = DeviceProblem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_problem }
    end
  end

  # GET /device_problems/1/edit
  def edit
    @device_problem = DeviceProblem.find(params[:id])
  end

  # POST /device_problems
  # POST /device_problems.json
  def create
    @device_problem = DeviceProblem.new(params[:device_problem])

    respond_to do |format|
      if @device_problem.save
        format.html { redirect_to @device_problem, notice: 'Device problem was successfully created.' }
        format.json { render json: @device_problem, status: :created, location: @device_problem }
      else
        format.html { render action: "new" }
        format.json { render json: @device_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_problems/1
  # PUT /device_problems/1.json
  def update
    @device_problem = DeviceProblem.find(params[:id])

    respond_to do |format|
      if @device_problem.update_attributes(params[:device_problem])
        format.html { redirect_to @device_problem, notice: 'Device problem was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_problems/1
  # DELETE /device_problems/1.json
  def destroy
    @device_problem = DeviceProblem.find(params[:id])
    @device_problem.destroy

    respond_to do |format|
      format.html { redirect_to device_problems_url }
      format.json { head :ok }
    end
  end
end
