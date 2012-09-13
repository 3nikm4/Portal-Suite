class PatientAssignmentsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  # GET /patient_assignments
  # GET /patient_assignments.json
  def index
    @patient_assignments = PatientAssignment.includes(:device, :patient).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 20)

    @device_assignments = PatientAssignment.includes(:device, :patient).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 20)
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patient_assignments }
    end
  end

  # GET /patient_assignments/1
  # GET /patient_assignments/1.json
  def show
    @patient_assignment = PatientAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient_assignment }
    end
  end

  # GET /patient_assignments/new
  # GET /patient_assignments/new.json
  def new
    @patient_assignment = PatientAssignment.new
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient_assignment }
    end
  end

  # GET /patient_assignments/1/edit
  def edit
    @patient_assignment = PatientAssignment.find(params[:id])
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")
  end

  # POST /patient_assignments
  # POST /patient_assignments.json
  def create
    @patient_assignment = PatientAssignment.new(params[:patient_assignment])

    respond_to do |format|
      if @patient_assignment.save
        format.html { redirect_to @patient_assignment, notice: 'Patient assignment was successfully created.' }
        format.json { render json: @patient_assignment, status: :created, location: @patient_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @patient_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patient_assignments/1
  # PUT /patient_assignments/1.json
  def update
    @patient_assignment = PatientAssignment.find(params[:id])

    respond_to do |format|
      if @patient_assignment.update_attributes(params[:patient_assignment])
        format.html { redirect_to @patient_assignment, notice: 'Patient assignment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_assignments/1
  # DELETE /patient_assignments/1.json
  def destroy
    @patient_assignment = PatientAssignment.find(params[:id])
    @patient_assignment.destroy

    respond_to do |format|
      format.html { redirect_to patient_assignments_url }
      format.json { head :ok }
    end
  end
  
  def dynamic_patients
    @location = Location.find(params[:id])
    @patients = @location.get_patients
    
    respond_to do |format|
      format.js
    end
  end

  def dynamic_devices
    @location = Location.find(params[:id])
    @devices = @location.get_devices
    
    respond_to do |format|
      format.js
    end
  end

  def sort_column
    PatientAssignment.column_names.include?(params[:sort]) ? params[:sort] : "monitor_end"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
