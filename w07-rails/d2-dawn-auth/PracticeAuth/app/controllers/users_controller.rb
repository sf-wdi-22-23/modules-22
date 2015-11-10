class UsersController < ApplicationController
    def new
    	# set up a dummy user for new user form
    	@user = User.new
    end

    def create
	    @user = User.new(user_params)
	    if @user.save
			# login user
			session[:user_id] = @user.id
			# redirect to user#show for this user
			redirect_to @user
	    else
			# there was an error, go back to signup page 
			redirect_to sign_up_path
	    end
    end

    def show
    	@user = @current_user
    end

    private
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
