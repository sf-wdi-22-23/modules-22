class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # get the currently logged in user from the db based on id stored in session
  def current_user
    # set instance variable to either nil (if session[:user_id] is nil)
    # or to the user with that id
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  # make current_user method available in views
  helper_method :current_user 
end
