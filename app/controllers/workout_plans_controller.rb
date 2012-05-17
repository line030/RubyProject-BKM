class WorkoutPlansController < ApplicationController
  # GET /workout_plans
  # GET /workout_plans.json
  def index
    @workout_plans = WorkoutPlan.all
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

    @workout_day.workout_plan_id = @workout_plan.id

    assign_workout_selection_list

    respond_to do |format|
      format.html # show.html.erb
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

  def assign_workout_selection_list

    @workout_day_selection_list = WorkoutDay.all.collect {|work| [ work.day, work.id ] }
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
