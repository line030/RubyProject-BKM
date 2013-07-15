class UserSessionsController < ApplicationController

  # make session if not authenticated ?
  skip_before_filter :authenticate, :only => [:new,:create]

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    user = User.find_by_login(params[:user_session][:login])

    @user_session = UserSession.new(params[:user_session])

    #render action: "new" if !user.enabled?
    if !user.nil? && user.enabled?
      @user_session.save

      redirect_to dashboard_path, notice: 'Succesfully logged in.'
    else
      redirect_to new_user_session_path, notice: 'You are blocked'
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'logged out' }
      format.json { head :no_content }
    end
  end
end
