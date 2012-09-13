class DisposableTypesController < ApplicationController
  load_and_authorize_resource

  # GET /disposable_types
  # GET /disposable_types.json
  def index
    @disposable_types = DisposableType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disposable_types }
    end
  end

  # GET /disposable_types/1
  # GET /disposable_types/1.json
  def show
    @disposable_type = DisposableType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disposable_type }
    end
  end

  # GET /disposable_types/new
  # GET /disposable_types/new.json
  def new
    @disposable_type = DisposableType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disposable_type }
    end
  end

  # GET /disposable_types/1/edit
  def edit
    @disposable_type = DisposableType.find(params[:id])
  end

  # POST /disposable_types
  # POST /disposable_types.json
  def create
    @disposable_type = DisposableType.new(params[:disposable_type])

    respond_to do |format|
      if @disposable_type.save
        format.html { redirect_to @disposable_type, notice: 'Disposable type was successfully created.' }
        format.json { render json: @disposable_type, status: :created, location: @disposable_type }
      else
        format.html { render action: "new" }
        format.json { render json: @disposable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disposable_types/1
  # PUT /disposable_types/1.json
  def update
    @disposable_type = DisposableType.find(params[:id])

    respond_to do |format|
      if @disposable_type.update_attributes(params[:disposable_type])
        format.html { redirect_to @disposable_type, notice: 'Disposable type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @disposable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disposable_types/1
  # DELETE /disposable_types/1.json
  def destroy
    @disposable_type = DisposableType.find(params[:id])
    @disposable_type.destroy

    respond_to do |format|
      format.html { redirect_to disposable_types_url }
      format.json { head :ok }
    end
  end
end
