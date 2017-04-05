module SessionsHelper

  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  def owner?(user_id)
    current_user && user_id == current_user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in_user
    unless logged_in?
      redirect_to root_url, notice: "Please sign in."
    end
  end

  def authenticate_user
    if session[:user_id] == nil
      redirect_to(:controller => 'posts', :action => 'index')
      return false
    else
      return true 
    end
  end

  def save_login_state
    if session[:user_id]
      flash[:error] = "You must logout to leave!"
      redirect_to(:controller => 'posts', :action => 'index')
      return false
    else
      return true
    end
  end
end
