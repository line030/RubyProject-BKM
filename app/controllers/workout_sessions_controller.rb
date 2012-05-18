class WorkoutSessionsController < ApplicationController

  def assign_workout_days_selection_list
    @workout_days_selection_list = WorkoutDay.all.collect { |w|
      [w.day, w.id]
    }
  end

  # GET /workout_sessions
  # GET /workout_sessions.json
  def index
    @workout_sessions = WorkoutSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_sessions }
    end
  end

  # GET /workout_sessions/1
  # GET /workout_sessions/1.json
  def show
    @workout_session = WorkoutSession.find(params[:id])
    exerciseWorkoutThrills = @workout_session.exercises_workout_thrills

    #if post, then update the workout details
    if request.post?
      joinedExercise = exerciseWorkoutThrills.find(params[:exercise][:exerciseWorkoutThrillsId])
      joinedExercise.value = params[:exercise][:value]
      joinedExercise.multiplier = params[:exercise][:multiplier]
      if joinedExercise.save
        flash[:notice] = "Activity logged"
      end

     # render :text =>  joinedExercise.save, :layout => false
     # return
    end

    if @workout_session.workout_day.nil?
        @day = "No Training Day in WorkOut Session"
      else
        @day = @workout_session.workout_day.day
    end


    @exercises = []
    exerciseWorkoutThrills.each do |e|
      @exercises << {:e => e.exercise, :id => e.id, :value => e.value, :multiplier => e.multiplier}
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout_session }
    end
  end

  # GET /workout_sessions/new
  # GET /workout_sessions/new.json
  def new
    @workout_session = WorkoutSession.new

    assign_workout_days_selection_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_session }
    end
  end

  # GET /workout_sessions/1/edit
  def edit
    @workout_session = WorkoutSession.find(params[:id])
    assign_workout_days_selection_list
  end

  # POST /workout_sessions
  # POST /workout_sessions.json
  def create
    @workout_session = WorkoutSession.new(params[:workout_session])

    workout_day_id = params[:workout_day][:id]    # fehler :(

    # if the selected workoutDay is null
    if (workout_day_id.empty? ) #workout_day_id.nil? ||
         @workout_session.workout_day = nil

    else
      workout_day = WorkoutDay.find(workout_day_id)
      @workout_session.workout_day = workout_day

      workout_day.exercises.each { |e|
        @workout_session.exercises << e
      }

    end

    respond_to do |format|
      if @workout_session.save
        format.html { redirect_to @workout_session, notice: 'Workout session was successfully created.' }
        format.json { render json: @workout_session, status: :created, location: @workout_session }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workout_sessions/1
  # PUT /workout_sessions/1.json
  def update
    @workout_session = WorkoutSession.find(params[:id])

    respond_to do |format|
      if @workout_session.update_attributes(params[:workout_session])
        format.html { redirect_to @workout_session, notice: 'Workout session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sessions/1
  # DELETE /workout_sessions/1.json
  def destroy
    @workout_session = WorkoutSession.find(params[:id])
    @workout_session.destroy

    respond_to do |format|
      format.html { redirect_to workout_sessions_url }
      format.json { head :no_content }
    end
  end
end
