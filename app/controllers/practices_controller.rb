class PracticesController < ApplicationController
  load_and_authorize_resource

  # GET /practices
  # GET /practices.json
  def index
    @practices = Practice.order("practice_name").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @practices }
    end
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
    @practice = Practice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.json
  def new
    @practice = Practice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @practice }
    end
  end

  # GET /practices/1/edit
  def edit
    @practice = Practice.find(params[:id])
  end

  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(params[:practice])

    respond_to do |format|
      if @practice.save
        format.html { redirect_to @practice, notice: 'Practice was successfully created.' }
        format.json { render json: @practice, status: :created, location: @practice }
      else
        format.html { render action: "new" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.json
  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to practices_url }
      format.json { head :ok }
    end
  end

  def sort_column
    Practice.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end