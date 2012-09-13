class SearchesController < ApplicationController

  before_filter :authenticate_user!

  # GET /searches
  # GET /searches.json
  def index
    @contacts = Contact.all
    @calltypes = CallType.all
#    @users = User.where( :group_id => '2' )
    @users = User.all
    @devices = Device.where( "device_type_id <> 3 AND device_type_id <> 4 AND device_type_id <> 5 AND device_type_id <> 6 AND device_type_id <> 7 and device_type_id <> 8" ).order( "serial_number ASC" )
    @patients = Patient.order( "last_name ASC" )
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/patient
  def patient
    @results = Call.joins(:user).where( "contact_id = ? AND `users`.`group_id` <> 1", params[:uid] )

    respond_to do |format|
      format.html # patient.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/type
  def type
    @results = Call.joins(:user).where( "call_type_id = ? AND `users`.`group_id` <> 1",params[:uid] )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/rep
  def rep
    @results = Call.joins(:user).where( "user_id = ? AND `users`.`group_id` <> 1", params[:uid] )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/date
  def date
    @srch_date_start = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i)
    @srch_date_end = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i + 1)
    @results = Call.joins(:user).where( " call_start BETWEEN @srch_date_start AND @srch_date_end AND `users`.`group_id` <> 1 " )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/device
  def device
    @results = Device.find(params[:uid])
  end

  # POST /searches/assignment_device
  def assignment_device
    @results = DeviceAssignment.where( :device_id => params[:uid] ).order( "device_assignments.start_date DESC" )
  end

  # POST /searches/assignment_patient
  def assignment_patient
    @results = DeviceAssignment.where( :patient_id => params[:uid] )
  end

  # POST /searches/assignment_patient
  def assignment_location
    @results = DeviceAssignment.where( :location_id => params[:uid] )
  end


  # GET /searches/results
  def results
    if params[:s] == "contact"
      @results = Call.where( :contact_id => params[:uid] )
    elsif params[:s] == "type"
      @results = Call.where( :call_type_id => params[:uid] )
    elsif params[:s] == "date"
      @srch_date_start = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i)
      @srch_date_end = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i + 1)
      @results = Call.where( :call_start => ( @srch_date_start..@srch_date_end ) )
    elsif params[:s] == "rep"
      @results = Call.where( :user_id => params[:uid] )
    end

    respond_to do |format|
      format.html # results.html.erb
      format.json { render json: @results }
    end
  end

end
