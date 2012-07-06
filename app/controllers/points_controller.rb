class PointsController < ApplicationController
  #GET /points
  def index
    #@points = Point.where('user_id = ?', current_user.id)
    @points = Point.order('created_at').reverse_order.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Unit.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to point_url }
      format.json { head :no_content }
    end
  end
end
