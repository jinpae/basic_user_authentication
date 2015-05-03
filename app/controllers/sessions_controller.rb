class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			# store user's id in a temporary session
			session[:user_id] = user.id
			redirect_to user, success: "Signed in successfully"
		else
			flash.now[:warning] = "Invalid email or password"
			render :new
		end
	end
end
