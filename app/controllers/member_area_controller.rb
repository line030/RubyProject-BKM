class MemberAreaController < ApplicationController
  #require ""

  before_filter :authenticate

  # GET /member_area
  def index

    @user = current_user
    @aim =  Aim.where("is_active=? and user_id=?",true, current_user.id).find_all().first

    if !@aim.aim_progresses.nil?

      @aimpro = AimProgress.where("aim_id=?", @aim.id).order('logging_date ASC').all

       #aimpro = AimProgress.all(:order => 'logging_date desc', :id => 'aim_id')


     #end


       #puts "Deniz_"
       #aimpro.each do |e|
       #  puts e.logging_date.strftime("%d.%m.%Y")
       #end

       #render :text => aimpro.class,  :layout => false
       #return

       #@aim.aim_progresses = aimpro


    end

    @actual_workout_plan = WorkoutPlan.where("is_active=? and user_id=?",true, current_user.id).find_all().first

    @actual_workout_session = WorkoutSession.where("user_id=?", current_user.id).order('date DESC').limit(1).find_all().first



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
end
