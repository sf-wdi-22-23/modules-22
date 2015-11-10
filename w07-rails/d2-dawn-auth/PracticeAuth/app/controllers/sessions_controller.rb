class SessionsController < ApplicationController
  # show the login form
  def new
    # TODO: render a login form view
  end

  # create the session, logging in the user
  def create
    user = User.confirm(params[:email], params[:password])
    if user
      # save the user's id into the session
      session[:user_id] = user.id
      #redirect to the show page
      redirect_to user_path(user.id)
    else
      #there was an error logging the user in
      redirect_to login_path
    end
  end
  
  # logout the current user
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
