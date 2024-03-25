class SessionsController < ApplicationController
	def create
		@user = User.find_by(username: params[:username])

		#Authenticate user credentials
		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to root_path
		else
			#Error on failure
			message = "Wrong username or password!"
			redirect_to login_path, notice: message
			puts "Not found"
		end
	end

	def destroy
	    if session[:user_id]
	      # Clear the user's session
	      session[:user_id] = nil
	      # Display logout message
	      flash[:notice] = "Successfully logged out"
	    
	    else
	    	flash[:error] = "Not logged-in!"
	    end
  	end
end