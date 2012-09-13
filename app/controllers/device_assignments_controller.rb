class DeviceAssignmentsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  # GET /device_assignments
  # GET /device_assignments.json
  def index
#    @device_assignments = DeviceAssignment.order( "start_date DESC" ).paginate(:page => params[:page], :per_page => 20)
    @device_assignments = DeviceAssignment.joins( :device ).joins("LEFT JOIN patients ON device_assignments.patient_id = patients.id").joins("LEFT JOIN locations ON device_assignments.location_id = locations.id").order( "devices.serial_number ASC" ).paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_assignments }
    end
  end

  # GET /device_assignments/1
  # GET /device_assignments/1.json
  def show
    @device_assignment = DeviceAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_assignment }
    end
  end

  # GET /device_assignments/new
  # GET /device_assignments/new.json
  def new
    @device_assignment = DeviceAssignment.new
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_assignment }
    end
  end

  # GET /device_assignments/1/edit
  def edit
    @device_assignment = DeviceAssignment.find(params[:id])
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")
  end

  # POST /device_assignments
  # POST /device_assignments.json
  def create
    @device_assignment = DeviceAssignment.new(params[:device_assignment])
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")

    respond_to do |format|
      if @device_assignment.save
        format.html { redirect_to @device_assignment, notice: 'Device assignment was successfully created.' }
        format.json { render json: @device_assignment, status: :created, location: @device_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @device_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /device_assignments/1
  # PUT /device_assignments/1.json
  def update
    @device_assignment = DeviceAssignment.find(params[:id])
    @locations = Location.order("location_name ASC")
    @patients = Patient.order("last_name ASC")
    @devices = Device.order("serial_number ASC")

    respond_to do |format|
      if @device_assignment.update_attributes(params[:device_assignment])
        format.html { redirect_to @device_assignment, notice: 'Device assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_assignments/1
  # DELETE /device_assignments/1.json
  def destroy
    @device_assignment = DeviceAssignment.find(params[:id])
    @device_assignment.destroy

    respond_to do |format|
      format.html { redirect_to device_assignments_url }
      format.json { head :no_content }
    end
  end

  def sort_column
    DeviceAssignment.column_names.include?(params[:sort]) ? params[:sort] : "start_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
