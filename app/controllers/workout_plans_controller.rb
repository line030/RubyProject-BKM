class WorkoutPlansController < ApplicationController

  before_filter :authenticate

  # GET /workout_plans
  # GET /workout_plans.json
  def index
    #@workout_plans = WorkoutPlan.joins(:users).where()
    #@workout_plans = WorkoutPlan.conditions(:users => {:user_id => current_user.id})
    #peter = @workout_plans.users_workout_plans
    #userK = User.find(current_user.id)
    @workout_plans = WorkoutPlan.find_all_by_user_id(current_user.id)

    @global_workout_plans = WorkoutPlan.find_all_by_is_global(true)

    #render :text =>  @workout_plans.size, :layout => false
    #return

    #peter.find_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_plans }
    end
  end

  # GET /workout_plans/1
  # GET /workout_plans/1.json
  def show
    @workout_plan = WorkoutPlan.find(params[:id])

    @workout_days = @workout_plan.workout_days

    @workout_day = WorkoutDay.new

    assign_workout_selection_lists

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout_plan }
    end
  end

  # GET /workout_plans/1/read_only
  def read_only
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_days = @workout_plan.workout_days

    respond_to do |format|
      format.html # read_only.html.erb
      format.json { render json: @workout_plan }
    end
  end

  def click
    render :text => 'PRESSED', :layout => false
  end

  def addWorkOut
    @workout_plan = WorkoutPlan.find(params[:id])

    workOutDayId = params[:workout_day][:id]
    workout_day = WorkoutDay.find(workOutDayId)

    @workout_plan.workout_days << workout_day

    @workout_plan.save

    respond_to do |format|
      format.html { redirect_to @workout_plan, notice: 'Workout day added!' }
      format.json { render json: @workout_plan, status: :created, location: @workout_plan }
    end
  end

  #POST /workout_plans/1/add_tag
  def add_tag
    @workout_plan = WorkoutPlan.find(params[:id])
    tag = Tag.create(:name => params[:tag][:name])
    @workout_plan.tags << tag

    @workout_plan.save

    respond_to do |format|
      format.html { redirect_to @workout_plan, notice: 'Successfully tagged' }
    end
  end

  #PUT /workout_plans/1/invert_active
  def invert_active
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_plan.is_active = !@workout_plan.is_active?

    @workout_plan.save!

    respond_to do |format|
      format.html { redirect_to workout_plans_path, notice: 'Successfully de-/activated' }
      format.json { render json: @workout_plan, status: :created, location: @workout_plan }
    end
  end

  def assign_workout_selection_lists

    @global_workout_day_selection_list = WorkoutDay.find_all_by_is_global(true).collect {|work| [ work.day, work.id ] }
    @workout_day_selection_list = WorkoutDay.find_all_by_user_id(current_user.id).collect {|work| [ work.day, work.id ] }

  end

  # GET /workout_plans/new
  # GET /workout_plans/new.json
  def new
    @workout_plan = WorkoutPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_plan }
    end
  end

  # GET /workout_plans/1/edit
  def edit
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  # POST /workout_plans
  # POST /workout_plans.json
  def create
    @workout_plan = WorkoutPlan.new(params[:workout_plan])
    @workout_plan.user_id = current_user.id

    respond_to do |format|
      if @workout_plan.save
        format.html { redirect_to @workout_plan, notice: 'Workout plan was successfully created.' }
        format.json { render json: @workout_plan, status: :created, location: @workout_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /workout_plans/1/copy
  def copy
    @workout_plan = WorkoutPlan.find(params[:id])
    @copy = WorkoutPlan.new(:name => @workout_plan.name + " [copy]")
    @copy.user_id = current_user.id

    @workout_plan.workout_days.each do |day|
      workoutDay = WorkoutDay.create(:day => day.day)
      workoutDay.exercises = day.exercises
      @copy.workout_days << workoutDay
    end
    respond_to do |format|
      if @copy.save
        format.html { redirect_to workout_plans_path, notice: 'Workout plan was successfully copied.' }
        format.json { render json: @copy, status: :created, location: @copy }
      else
        format.html { render action: "copy" }
        format.json { render json: @copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workout_plans/1
  # PUT /workout_plans/1.json
  def update
    @workout_plan = WorkoutPlan.find(params[:id])

    respond_to do |format|
      if @workout_plan.update_attributes(params[:workout_plan])
        format.html { redirect_to @workout_plan, notice: 'Workout plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_plans/1
  # DELETE /workout_plans/1.json
  def destroy
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_plan.destroy

    respond_to do |format|
      format.html { redirect_to workout_plans_url }
      format.json { head :no_content }
    end
  end
end
