class ResultsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /results
  # GET /results.json
  def index
    @contacts = Contact.all
    @calltypes = CallType.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/patient/:id
  def patient
    @results = Contact.where( :id => params[:patient] )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/calltype/:id
  def calltype
  end

  # GET /results/results
  def search
    if params[:s] == "contact"
      @results = Call.where( :contact_id => params[:uid] )
    elsif params[:s] == "type"
      @results = Call.where( :call_type_id => params[:uid] )
    elsif params[:s] == "date"
      @results = Call.where( )
    elsif params[:s] == "rep"
      @results = Call.where( :user_id => params[:uid] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

end
