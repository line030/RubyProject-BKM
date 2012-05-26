class AimsController < ApplicationController

  before_filter :authenticate

  # GET /aims
  # GET /aims.json
  def index
    @aims = Aim.all

    category = @aims.collect { | e |
      e.category ? [e.id, e.category.name] : [e.id, "no Category specified"]
    }
    @categories = Hash[*(category.flatten)]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aims }
    end
  end

  # GET /aims/1
  # GET /aims/1.json
  def show
    @aim = Aim.find(params[:id])
    @category = @aim.category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aim }
    end
  end

  # GET /aims/new
  # GET /aims/new.json
  def new
    @aim = Aim.new
   # @category_selection_list = []
    assign_category_selection_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aim }
    end
  end

  def assign_category_selection_list

    @category_selection_list = []

    if  !Category.all.empty?
      @category_selection_list = Category.all.collect {|category| [ category.name, category.id ] }

    end

  end

  # GET /aims/1/edit
  def edit
    @aim = Aim.find(params[:id])
    assign_category_selection_list
  end

  # POST /aims
  # POST /aims.json
  def create
    @aim = Aim.new(params[:aim])

    respond_to do |format|
      if @aim.save
        format.html { redirect_to @aim, notice: 'Aim was successfully created.' }
        format.json { render json: @aim, status: :created, location: @aim }
      else
        format.html { render action: "new" }
        format.json { render json: @aim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aims/1
  # PUT /aims/1.json
  def update
    @aim = Aim.find(params[:id])

    respond_to do |format|
      if @aim.update_attributes(params[:aim])
        format.html { redirect_to @aim, notice: 'Aim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aims/1
  # DELETE /aims/1.json
  def destroy
    @aim = Aim.find(params[:id])
    @aim.destroy

    respond_to do |format|
      format.html { redirect_to aims_url }
      format.json { head :no_content }
    end
  end
end
