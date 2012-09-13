class CallTypesController < ApplicationController
  # GET /call_types
  # GET /call_types.json
  def index
    @call_types = CallType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @call_types }
    end
  end

  # GET /call_types/1
  # GET /call_types/1.json
  def show
    @call_type = CallType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call_type }
    end
  end

  # GET /call_types/new
  # GET /call_types/new.json
  def new
    @call_type = CallType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call_type }
    end
  end

  # GET /call_types/1/edit
  def edit
    @call_type = CallType.find(params[:id])
  end

  # POST /call_types
  # POST /call_types.json
  def create
    @call_type = CallType.new(params[:call_type])

    respond_to do |format|
      if @call_type.save
        format.html { redirect_to @call_type, notice: 'Call type was successfully created.' }
        format.json { render json: @call_type, status: :created, location: @call_type }
      else
        format.html { render action: "new" }
        format.json { render json: @call_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /call_types/1
  # PUT /call_types/1.json
  def update
    @call_type = CallType.find(params[:id])

    respond_to do |format|
      if @call_type.update_attributes(params[:call_type])
        format.html { redirect_to @call_type, notice: 'Call type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_types/1
  # DELETE /call_types/1.json
  def destroy
    @call_type = CallType.find(params[:id])
    @call_type.destroy

    respond_to do |format|
      format.html { redirect_to call_types_url }
      format.json { head :no_content }
    end
  end
end
