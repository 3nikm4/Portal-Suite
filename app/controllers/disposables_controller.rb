class DisposablesController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  # GET /disposables
  # GET /disposables.json
  def index
    @disposables = Disposable.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disposables }
    end
  end

  # GET /disposables/1
  # GET /disposables/1.json
  def show
    @disposable = Disposable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disposable }
    end
  end

  # GET /disposables/new
  # GET /disposables/new.json
  def new
    @disposable = Disposable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disposable }
    end
  end

  # GET /disposables/1/edit
  def edit
    @disposable = Disposable.find(params[:id])
  end

  # POST /disposables
  # POST /disposables.json
  def create
    @disposable = Disposable.new(params[:disposable])

    respond_to do |format|
      if @disposable.save
        format.html { redirect_to @disposable, notice: 'Disposable was successfully created.' }
        format.json { render json: @disposable, status: :created, location: @disposable }
      else
        format.html { render action: "new" }
        format.json { render json: @disposable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disposables/1
  # PUT /disposables/1.json
  def update
    @disposable = Disposable.find(params[:id])

    respond_to do |format|
      if @disposable.update_attributes(params[:disposable])
        format.html { redirect_to @disposable, notice: 'Disposable was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @disposable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disposables/1
  # DELETE /disposables/1.json
  def destroy
    @disposable = Disposable.find(params[:id])
    @disposable.destroy

    respond_to do |format|
      format.html { redirect_to disposables_url }
      format.json { head :ok }
    end
  end

  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "disposable_type_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
