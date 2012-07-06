class WorkoutSessionsController < ApplicationController
  before_filter :authenticate

  def assign_workout_days_selection_list
    @workout_days_selection_list = WorkoutDay.all.collect { |w|
      [w.day, w.id]
    }
  end

  # GET /workout_sessions
  # GET /workout_sessions.json
  def index
    @workout_sessions = WorkoutSession.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_sessions }
    end
  end

  # GET /workout_sessions/1
  # GET /workout_sessions/1.json
  def show
    @workout_session = WorkoutSession.find(params[:id])
    if !user_is_allowed?(@workout_session)
      redirect_to workout_sessions_path
      return
    end


    exerciseWorkoutThrills = @workout_session.exercises_workout_thrills

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

  #POST /workout_sessions/1/update_thrill
  def update_thrill
      render :text => params.to_s, :layout => false
      return
      @workout_session = WorkoutSession.find(params[:id])

      joinedExercise = ExercisesWorkoutThrill.find(params[:exercise][:exerciseWorkoutThrillsId])
      joinedExercise.value = params[:exercise][:value]
      joinedExercise.multiplier = params[:exercise][:multiplier]

      if joinedExercise.points.empty?
        pointsAwarded = 1
        pointsAwarded = joinedExercise.exercise.points if !joinedExercise.exercise.points.nil?
        joinedExercise.points << Point.create(:value => pointsAwarded, :user => current_user)
      end

      joinedExercise.save

      respond_to do |format|
        format.html { redirect_to @workout_session, notice: 'Activity logged.' }
        format.json { render json: @workout_session }
      end

  end

  #POST /workout_sessions/1/update_thrill
  def create_thrills
    @workout_session = WorkoutSession.new
    @workout_session.user = current_user

    workout_day = WorkoutDay.find(params[:id])
    @workout_session.workout_day = workout_day

    @workout_session.date = params[:session][:date]

    params[:exercises].each_value do |e|
      e.each_value do |thrill|
        exercise = Exercise.find(thrill[:id])
        ewt = ExercisesWorkoutThrill.new
        ewt.exercise = exercise
        ewt.workout_session = @workout_session
        ewt.multiplier = thrill[:multiplier]
        ewt.value = thrill[:value]

        if ewt.save
          award_points_by_thrill(ewt)
        end
      end

    end
    @workout_session.save!

    respond_to do |format|
      format.html { redirect_to @workout_session, notice: 'Workout saved.' }
      format.json { render json: @workout_session }
    end

  end

  def award_points_by_thrill(t)
    #count points if value && multiplier != nil
    if (!t.value.nil? && !t.multiplier.nil?)
      pointsAwarded = 1
      pointsAwarded = t.exercise.points if !t.exercise.points.nil?
      t.points << Point.create(:value => pointsAwarded, :user => current_user)
      t.save!
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

  #GET /workout_plan/log/:id
  def log_workout
    @workout_day = WorkoutDay.find(params[:id])

    @exercises = @workout_day.exercises

    respond_to do |format|
      format.html # log_workout.html.erb
    end
  end

  # GET /workout_sessions/1/edit
  def edit
    @workout_session = WorkoutSession.find(params[:id])
    if !user_is_allowed?(@workout_session)
      redirect_to workout_sessions_path
      return
    end

    assign_workout_days_selection_list
  end

  # POST /workout_sessions
  # POST /workout_sessions.json
  def create
    render :text => params.to_s, :layout => false
    return

    @workout_session = WorkoutSession.new(params[:workout_session])
    @workout_session.user = current_user

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
    if !user_is_allowed?(@workout_session)
      redirect_to workout_sessions_path
      return
    end

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
    if !user_is_allowed?(@workout_session)
      redirect_to workout_sessions_path
      return
    end
    thrills = @workout_session.exercises_workout_thrills
    thrills.each do |t|
      puts "Fuck you!!! " + t.points.as_json.to_s
      t.points.each do |p|
        p.destroy
      end
    end
    @workout_session.destroy

    respond_to do |format|
      format.html { redirect_to workout_sessions_url }
      format.json { head :no_content }
    end
  end

  def user_is_allowed?(workout_session)
    if workout_session.user_id.equal?(current_user.id)
      return true
    else
      return false
    end
  end
end
