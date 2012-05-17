class WorkoutDaysController < ApplicationController
  # GET /workout_days
  # GET /workout_days.json
  def index
    @workout_days = WorkoutDay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_days }
    end
  end

  # GET /workout_days/1
  # GET /workout_days/1.json
  def show
    @workout_day = WorkoutDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout_day }
    end
  end

  # GET /workout_days/new
  # GET /workout_days/new.json
  def new
    @workout_day = WorkoutDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_day }
    end
  end

  # GET /workout_days/1/edit
  def edit
    @workout_day = WorkoutDay.find(params[:id])
  end

  # POST /workout_days
  # POST /workout_days.json
  def create
    @workout_day = WorkoutDay.new(params[:workout_day])

    respond_to do |format|
      if @workout_day.save
        format.html { redirect_to @workout_day, notice: 'Workout day was successfully created.' }
        format.json { render json: @workout_day, status: :created, location: @workout_day }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workout_days/1
  # PUT /workout_days/1.json
  def update
    @workout_day = WorkoutDay.find(params[:id])

    respond_to do |format|
      if @workout_day.update_attributes(params[:workout_day])
        format.html { redirect_to @workout_day, notice: 'Workout day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_days/1
  # DELETE /workout_days/1.json
  def destroy
    @workout_day = WorkoutDay.find(params[:id])
    @workout_day.destroy

    respond_to do |format|
      format.html { redirect_to workout_days_url }
      format.json { head :no_content }
    end
  end
end
