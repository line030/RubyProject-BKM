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

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @aims }
    end
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
