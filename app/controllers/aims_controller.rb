class AimsController < ApplicationController

  before_filter :authenticate

  # GET /aims
  # GET /aims.json
  def index
    @aims = Aim.find_all_by_user_id(current_user.id)

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
    @aim_progress = AimProgress.new

    if !user_is_allowed?(@aim)
      redirect_to aims_path
      return
    end

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
    if !user_is_allowed?(@aim)
      redirect_to aims_path
      return
    end

    assign_category_selection_list
  end

  # POST /aims
  # POST /aims.json
  def create
    @aim = Aim.new(params[:aim])
    @aim.user = current_user

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
    if !user_is_allowed?(@aim)
      redirect_to aims_path
      return
    end

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
    if !user_is_allowed?(@aim)
      redirect_to aims_path
      return
    end
    @aim.destroy

    respond_to do |format|
      format.html { redirect_to aims_url }
      format.json { head :no_content }
    end
  end

  def user_is_allowed?(aim)
    if aim.user_id.equal?(current_user.id)
      return true
    else
      return false
    end
  end

  #PUT /aims/1/invert_active
  def invert_active
    @aim = Aim.find(params[:id])
    @aim.is_active = !@aim.is_active?

    @aim.save!

    respond_to do |format|
      format.html { redirect_to aims_path, notice: 'Successfully de-/activated' }
      format.json { render json: @aim, status: :created, location: @aim }
    end
  end

  #TO:DO
  #def de_active
  # // nur einer is  true oder keiner!
  #end


  def add_new_aim_pro
    @aim = Aim.find(params[:id])

    #render :text => params[:aim_progress][:date], :layout => false
    #return

    if params[:aim_progress_value].blank?

    else
      @aim_progress = AimProgress.new
      @aim_progress.value = params[:aim_progress_value]
      @aim_progress.logging_date = params[:aim_progress_logging_date].to_time
      @aim_progress.aim_id = params[:id]
      @aim_progress.save!

      #render :text => @aim_progress.to_json, :layout => false
      #return

      @aim.aim_progresses << @aim_progress

      @aim.save!

    end

    redirect_to aim_path()
  end

  def invert_active
    @aim = Aim.find(params[:id])


    @aim.is_active = !@aim.is_active?

    #render :text => @aim.name, :layout => false
    #return

    @aim.save!

    respond_to do |format|
      format.html { redirect_to aims_path, notice: 'Successfully de-/activated' }
      format.json { render json: @aim, status: :created, location: @aim }
    end
  end

end
