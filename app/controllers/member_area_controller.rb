class MemberAreaController < ApplicationController
  #require ""

  before_filter :authenticate

  # GET /member_area
  def index

    @user = current_user
    @aim =  Aim.where("is_active=? and user_id=?",true, current_user.id).find_all().first

    if !@aim.nil? && !@aim.aim_progresses.nil?
      @aimpro = AimProgress.where("aim_id=?", @aim.id).order('logging_date ASC').all
      @aim_value_start = formatDecimal(@aimpro.first.value, 2)
      @aim_value_actual = formatDecimal(@aimpro.last.value, 2)
      @aim_delta_actual = formatDecimal(@aimpro.last.value - @aimpro.first.value, 2)
      @aim_delta_goal = formatDecimal(@aim.value - @aimpro.last.value, 2)
      @aim_goal = @aim.value
    end

    @actual_workout_plan = WorkoutPlan.where("is_active=? and user_id=?",
                                             true, current_user.id).find_all().first

    @actual_workout_session = WorkoutSession.where("user_id=?",
                                                   current_user.id).order('date DESC').limit(1).find_all().first


    last3 = WorkoutSession.where("user_id=?",
                         current_user.id).order('date DESC').limit(3).find_all()
    #get 3 precedent of same drill
    exercises = Hash.new {|h,k| h[k] = [] }
    last3.each { |workout_session|
      #workout_session.exercises.each { |exercise|
        #exercises.join(exercise.id)
        #thrills = ExercisesWorkoutThrill.where("exercise_id=?", exercise.id).order('date DESC').limit(3).find_all()
      assemble_last_workouts(workout_session).each do |k,v|
          exercises[k] << v
      end
      #exercises.merge(assemble_last_workouts(workout_session).to_hash)
      #}
    }
    # exercises.distinct


    #assemble_last_workouts

  # render :text => exercises.to_s, :layout => false
  # return


    @last_workouts = exercises


    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @aims }
    end
  end

  def assemble_last_workouts(workout_session)
    #@last_workout = Hash.new
    models = Hash.new
    workoutModel = WorkoutModel.new
    workout_session.exercises_workout_thrills.each { |thrill|
      if thrill.value.nil? && thrill.multiplier.nil?
        next
      end
      #thrills = Hash.new {|h,k| h[k] = [] }
      #thrills = @last_workout[thrill.exercise.name] << { :wdh => thrill.multiplier, :kg => thrill.value }

      # get correct workout
      workout = models[thrill.exercise.name] if models.has_key?(thrill.exercise.name)

      #if !workout.nil? #workout already there
      if models.has_key?(thrill.exercise.name)
        models[thrill.exercise.name].exerciseData << {:value => thrill.value, :multiplier => thrill.multiplier}
      else
        tmp = WorkoutModel.new
        tmp.name = thrill.exercise.name
        tmp.date = workout_session.date
        tmp.exerciseData = {}
        #tmp.exerciseData.store(:test, "testo")
        tmp.exerciseData = [{:value => thrill.value, :multiplier => thrill.multiplier}]
        models[thrill.exercise.name] = tmp
      end


      #workoutModel.name = thrill.exercise.name if workoutModel.name.nil?
      #workoutModel.date = @actual_workout_session.date if workoutModel.date.nil?
      #if workoutModel.exerciseData.nil?
      #  workoutModel.exerciseData =[{:value => thrill.value, :multiplier => thrill.multiplier}]
      #else
       # workoutModel.exerciseData << {:value => thrill.value, :multiplier => thrill.multiplier}
      #end

      #models[workoutModel.name] = workoutModel

      models
    }

    models
    #render :text => models.to_s, :layout => false
    #return

  end

  # GET /aims/1
  # GET /aims/1.json
  def show
    respond_to do |format|
      format.html # index.html.erb
                  #format.json { render json: @aims }
    end
  end

  def formatDecimal(value, count)
    return ("%."+count.to_s+"f") % value
  end
end

class WorkoutModel
  attr :name, true # benchpress
  attr :date, true # 01.02.2013
  attr :exerciseData, true # [{value, multiplier}]
end
