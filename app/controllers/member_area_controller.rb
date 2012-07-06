class MemberAreaController < ApplicationController
  #require ""

  before_filter :authenticate

  # GET /member_area
  def index

    @user = current_user
    @aim =  Aim.where("is_active=? and user_id=?",true, current_user.id).find_all().first

    #render :text => aim.name,  :layout => false
    #return

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
