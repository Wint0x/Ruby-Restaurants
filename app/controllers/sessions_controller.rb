class SessionsController < ApplicationController
	def create
		@user = User.find_by(username: params[:username])

		#Authenticate user credentials
		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path
		else
			#Error on failure
			message = "Wrong username or password!"
			redirect_to login_path, notice: message
			puts "Not found"
		end
	end
end