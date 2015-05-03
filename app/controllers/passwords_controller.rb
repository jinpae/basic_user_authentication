class PasswordsController < ApplicationController
  def new
  end

	def create
		user = User.find_by(email: params[:email])
		user.send_password_reset_instructions if user

		redirect_to root_url, info: "Email sent with password reset instructions"
	end

  def edit
  end
end
