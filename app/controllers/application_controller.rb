class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method	:current_user_session, :current_user, :current_points

  protected
  def current_user_session
  @current_user_session = UserSession.find
  end

  def current_user
    current_user ||= current_user_session &&
        current_user_session.user
  end

  # check if User is Valid
  def authenticate
    unless current_user
      flash[:notice] = 'You are not logged in!'
      redirect_to new_user_session_path
      return false
    end
  end

  def current_points
    points = 0
    if !current_user.nil?
      points_set = current_user.points

      points_set.each do |p|
        points += p.value
      end
    end

    return points
  end

end
