class SessionsController < ApplicationController
  def new
  end

	def create
		if user = User.authenticate(params[:email], params[:password])
			# manage session via cookies
			if params[:remember_me]
				cookies.permanent[:auth_token] = user.auth_token
			else
				cookies[:auth_token] = user.auth_token
			end

			redirect_to user, success: "Signed in successfully"
		else
			flash.now[:warning] = "Invalid email or password"
			render :new
		end
	end

	def destroy
		cookies.delete(:auth_token)
		redirect_to root_url, success: "Signed out successfully"
	end
end
