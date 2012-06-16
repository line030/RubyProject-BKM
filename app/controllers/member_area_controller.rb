class MemberAreaController < ApplicationController
  before_filter :authenticate

  # GET /member_area
  def index
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
