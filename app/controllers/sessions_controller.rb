class SessionsController < ApplicationController
  def new
  end

	def create
		if user = User.authenticate(params[:email], params[:password])
			# store user's id in a temporary session
			session[:user_id] = user.id
			redirect_to user, success: "Signed in successfully"
		else
			flash.now[:warning] = "Invalid email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, success: "Signed out successfully"
	end
end
