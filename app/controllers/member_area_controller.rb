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
    @aim = Aim.find(params[:id])
    @category = @aim.category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aim }
    end
  end
end
