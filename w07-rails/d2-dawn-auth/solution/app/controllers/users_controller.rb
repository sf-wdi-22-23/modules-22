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
        # find the user for this url from database
        @user = User.find(params[:id])
        # check if this is the currently logged in user's profile page
        if session[:user_id] == @user.id
            @my_profile = true
        end
        # show the page
        render :show
    end



    private
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
